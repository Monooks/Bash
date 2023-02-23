#!/bin/bash
echo "Do yo want some magic? (mathmagic)"
echo "Give me a number!(Enter a number)"
echo "Let A="
read a
echo "Give me another one!(Enter another or a same number)"
echo "Let B="
read b
echo "Make some magic!"
if [[ $a -gt $b ]]; then
        echo "A - B = $(($a-$b))";
elif [[ $a -lt $b ]]; then
        echo "B - A = $(($b-$a))";
else
        echo "A^2 (or B^2) = $(($a*$b))";
fi;
echo "Voila, yoptyt'!"
