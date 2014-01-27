#!/bin/sh

if [ $# -lt 1 ]
   then
        echo "Extracts SQL inserts for distinct models from yeardata"
        echo "Usage: extract_distinct_models.sh <yeardatafile>"
   exit 1;
fi

cat $1 | awk 'split($0, a, "'\''") {$2 = a[2]} {$3 = $(NF - 1)} {$4 = a[4]} {print "INSERT INTO model (make_id,model) SELECT m._id, '\''"$4"'\'' FROM manufacturer m WHERE m.make='\''"$2"'\'';"}' | sort | uniq
