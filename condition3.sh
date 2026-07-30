#!/bin/bash

num=$1
if [ $num -gt 18 ]; then
echo "you are eligible to vote"
elif [ $num -eq 18 ]; then
echo "you are still 18"
else
echo "you are not eligible to vote."
fi