#!/bin/bash

# for list in val1 val2 val3 val4 ; do
#     echo Value is $list
# done     

val=10
while [ $val -gt 0 ]; do
   echo "I = $val"
   val=$(($val-1))
done   
