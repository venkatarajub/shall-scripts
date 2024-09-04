#!/bin/bash
#sum
ADDITION(){
    Number1=$1
    Number2=$2
    SUM=$(($Number1 + $Number2))
    MUL=$(($Number1 * $Number2))
    echo "Addition of given numbers is $SUM"
    echo "Muliplication of given numbers is $MUL" 
}

ADDITION 20 10