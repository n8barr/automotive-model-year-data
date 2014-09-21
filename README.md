automotive-model-year-data
==========================

Automotive data including vehicle model, make, and year for database creation. Currently includes 7,268 model-years.

### To use:
	
	$ cd automotive-model-year-data
	$ mysql -u root
	mysql> use yourDbName;
	mysql> source schema.sql;
	mysql> source data.sql;

### Notes:

I needed vehicle data for an app and could not find any source that was complete, clean, and free. I hope this can help others who face the same challenge :)

Please send pull requests for any data additions, modifications, or deduplications you can find!

This data is sourced partly from [Freebase](http://freebase.com), licensed under [CC-BY](http://creativecommons.org/licenses/by/2.5/), and is free for you to use and modify under that license.
