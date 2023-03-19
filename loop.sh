#!/bin/bash

# for list in val1 val2 val3 val4 ; do
#     echo Value is $list
# done     

val=0
while [ $val -lt 10 ]; do
   echo "I = $val"
   i=$(($val+1))
done   
