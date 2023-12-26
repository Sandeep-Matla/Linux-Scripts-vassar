#!/bin/bash
if [[ $1 =~ ^[0-9]+$ ]]; then
	str="cd ../"
	count=1
	while [ $count -lt $1 ]; do
		str+="../"
		((count++))
	done
	eval "$str"
else
	echo "Argument is not a number."
fi