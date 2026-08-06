#!/bin/bash

echo "Enter a number:"
read num

if [ $((num % 2)) -eq 0 ]
then
    echo "$num is an Even number"
else
    echo "$num is an Odd number"
fi


count=0
for ((i=2; i<num; i++))
do
    if [ $((num % i)) -eq 0 ]
    then
        count=$((count+1))
    fi
done

if [ $count -eq 0 ] && [ $num -gt 1 ]
then
    echo "$num is a Prime number"
else
    echo "$num is not a Prime number"
fi

