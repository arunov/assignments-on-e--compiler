#!/bin/bash
for i in `seq 1 19`;
do
	if [ "$i" -lt "10" ]
	then
		num=0$i
	else
		num=$i
	fi

	testname=test$num
	filename=in$num
	refout=out$num

	echo $testname

	if [ -f $filename ]
	then
		../demo $filename > temp
		if [ -f ./$refout ]
		then
			echo diff:
			diff $refout temp
		else
			echo No file $refout
			echo output:
			cat temp
		fi
	else
		echo No file $filename
	fi

	echo ~~~~

	if [ -f temp ]
	then
		rm temp
	fi
done

