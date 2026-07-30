#!/bin/bash

time=$(date +s%)
echo "query executed at $time"
sleep 5
end=$(date +s%)
total=$(($time - $end))
echo "script executed in $total seconds..."