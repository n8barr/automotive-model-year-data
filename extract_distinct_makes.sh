#!/bin/sh

if [ $# -lt 1 ]
   then
        echo "Extracts SQL inserts for distinct makes from yeardata"
        echo "Usage: extract_distinct_makes.sh <yeardatafile>"
   exit 1;
fi

cat $1 | awk 'split($0, a, "'\''") {$2 = a[2]} {$3 = $(NF - 1)} {$4 = a[4]} {print "INSERT INTO manufacturer (make) VALUES('\''"$2"'\'');"}' | sort | uniq
