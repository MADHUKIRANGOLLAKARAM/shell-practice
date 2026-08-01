#!/bin/bash

time=$(date +%s)
echo "query executed at $time"
sleep 5
end=$(date +%s)
total=$(($end - $time))
echo "script executed in $total seconds..."