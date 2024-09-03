#!/bin/bash
echo "Please enter  the length of rectangle : "
read length
echo "Please enter the width of rectangle : "
read width

AREA=$(($length*$width))

echo "area of rectangle is $AREA"