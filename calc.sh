#!/bin/bash
while true; do
    read -p "Say me the first number?" a
    read -p "Say me the second number?" b
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
    ans=$(echo "$a $op $b" | bc -l)
    printf "%s %s %s = %s\n\n" "$a" "$op" "$b" "$ans"
break
done
