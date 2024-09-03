#!/bin/bash
NUMBER=$1

if [ $NUMBER -gt 25 ]
then
    echo "$NUMBER is greater then 25"
else
    echo "$NUMBER is less then 25"
fi