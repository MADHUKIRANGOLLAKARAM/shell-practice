#!/bin/bash

start=$(date +%s)
echo "script executed at $start"
sleep 10
end=$(date +%s)
total=$(($end-$start))
echo "script executed in $total seconds."