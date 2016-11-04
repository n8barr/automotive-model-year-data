#!/bin/bash
#
# This script will insert the data into an sqlite3 db. There are unfortunately
# a number of things that have to be done to get there.
# 
if [ $# -eq 0 ]; then
  echo 'Give the db as the first arg';
  exit -1
fi

db=$1
insert='INSERT INTO VehicleModelYear (year, make, model) VALUES '
pwd=`pwd`

schema() {
  echo "Creating Schema"
  cat << ENDL | sqlite3 $pwd/$db 
    CREATE TABLE 'VehicleModelYear' (
      'id' INTEGER PRIMARY KEY,
      'year' INTEGER NOT NULL,
      'make' TEXT NULL,
      'model' TEXT NOT NULL,
      UNIQUE ('year', 'make', 'model')
    );
    CREATE INDEX 'I_VehicleModelYear_year' on VehicleModelYear('year');
    CREATE INDEX 'I_VehicleModelYear_make' on VehicleModelYear('make');
    CREATE INDEX 'I_VehicleModelYear_model' on VehicleModelYear('model');
ENDL
}

data() {
  # For some reason sqlite3 really doesn't like a lot of stuff going in at once.
  echo -n "Inserting Data"
  place=`mktemp -d`

  cd $place
  split -l 500 $pwd/data.sql 

  cat xaa | grep -v "$insert" > xaa.tmp
  mv xaa.tmp xaa

  for file in *; do
    echo -n .
    cat $file | sed -Ee "1 s/^(.)/$insert\1/" -e '$ s/,$/;/g' | sqlite3 $pwd/$db 
  done

  rm -r $place
}

schema
data
