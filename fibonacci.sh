#!/bin/bash

echo "enter the number "
read num

a=0
b=1

for ((i=1; i<=num; i++))
do
    echo -n "$a "
    sum=$((a+b))
    a=$b
    b=$sum
done
