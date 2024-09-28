#!/bin/sh
CC=/home/dev/a1/bin/bminor
OUTPUT_DIR=output
for testfile in good*.bminor
do
	if $CC -scan $testfile > $OUTPUT_DIR/$testfile.out
	then
		echo "$testfile success (as expected)"
	else
		echo "$testfile failure (INCORRECT)"
	fi
done

#for testfile in bad*.bminor
#do
#	if $CC -scan $testfile > $OUTPUT_DIR/$testfile.out
#	then
#		echo "$testfile success (INCORRECT)"
#	else
#		echo "$testfile failure (as expected)"
#	fi
#done
