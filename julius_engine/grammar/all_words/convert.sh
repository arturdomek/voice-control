#!/bin/sh

awk '{for(i=1;i<3;i++) $i="";print}' dict | awk '{print substr($0, 0, length($0)-2)}'> tmp1.txt
awk '{print $1}' dict > tmp2.txt
paste tmp2.txt tmp1.txt > dict2

rm tmp1.txt tmp2.txt
