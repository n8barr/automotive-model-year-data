automotive-model-year-data
==========================

Normalised version of automotive-model-year data that is easier to keep consistent. 
Some duplicates are removed and some recent popular European models added,
with an emphasis on FFVs. The list is still by no means complete.
Includes schema creation statements for MySQL and sqlite3,
scripts for extracting distinct make and model data and a statement for
populating the original schema from normalised data.

### Preparation (requires ksh installed):

        $ cd automotive-model-year-data
        $ ./extract_distinct_makes.sh populate_year.sql >populate_manufacturer.sql
        $ ./extract_distinct_models.sh populate_year.sql >populate_model.sql

### To use with MySQL:
	
	$ mysql -u root
	mysql> use yourDbName;
	mysql> source schema.sql;
	mysql> source schema_normalised_mysql.sql;
	mysql> source data.sql;
	mysql> source populate_manufacturer.sql;
	mysql> source populate_model.sql;
	mysql> source populate_year.sql;

### To insert the normalised data into the original format table:

	mysql> source insert_flat.sql

### To use with sqlite3:

	$ sqlite3 autodata.db < schema_sqlite.sql 
	$ sqlite3 autodata.db < populate_manufacturer.sql
	$ sqlite3 autodata.db < populate_model.sql
	$ sqlite3 autodata.db < populate_year.sql
                                        
### Notes:

-This data is sourced partly from [Freebase](http://freebase.com), licensed under [CC-BY](http://creativecommons.org/licenses/by/2.5/), and is free for you to use and modify under that license.
