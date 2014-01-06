#!/bin/sh

./generate_year_models.sh $2 $3 $4 >newmodels_tmp.sql
cat $1 newmodels_tmp.sql | sort | uniq > year_models_tmp.sql 
rm $1
mv year_models_tmp.sql $1
rm newmodels_tmp.sql 

