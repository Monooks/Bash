#!/bin/bash
while true; do
    read -p "Say me the first number? " n1
    read -p "Say me the second number? " n2
    PS3="What kind of operation you want?"
    select ans in add subtract multiply divide; do
        case $ans in
            add) op='+' ; break ;;
            subtract) op='-' ; break ;;
            multiply) op='*' ; break ;;
            divide) op='/' ; break ;;
            *) echo "invalid response" ;;
        esac
    done
    ans=$(echo "$n1 $op $n2" | bc -l)
    printf "%s %s %s = %s\n\n" "$n1" "$op" "$n2" "$ans"
break
done
