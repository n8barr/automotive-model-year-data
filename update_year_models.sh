#!/bin/bash

if [ $# -lt 4 ]
   then 
	echo "Updates year data with a given make and model in the specified year range."
	echo "Usage: update_year_models.sh <yeardatafile> <make> <model> <fromyear>-<toyear>"
   exit 1;
fi

./generate_year_models.sh "$2" "$3" $4 >newmodels_tmp.sql
cat $1 newmodels_tmp.sql | sort | uniq > year_models_tmp.sql 
rm $1
mv year_models_tmp.sql $1
rm newmodels_tmp.sql 

