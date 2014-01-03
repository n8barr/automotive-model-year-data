#!/bin/ksh

start=`echo "$3" | awk '{split($0,a,"-"); print a[1]}'`
end=`echo "$3" | awk '{split($0,a,"-"); print a[2]}'`

for i in {$start..$end} 
do
	echo "INSERT INTO year (year,model_id) SELECT $i, m._id FROM manufacturer ma, model m WHERE m.make_id=ma._id AND ma.make='$1' AND m.model='$2';"
done

