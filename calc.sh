#!/bin/bash
while true; do
        PS3="What kind of operation do you want?"
        select ans in add subtract multiply divide; do
                case $ans in
                        add) op='+' ; break ;;
                        subtract) op='-' ; break ;;
                        multiply) op='*' ; break ;;
                        divide) op='/' ; break ;;
                        *) echo "invalid response" ;;
                esac
        done
        read -p "Say me the first number?" a
        if [[ $a =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
                echo "${a} is a number"
        else
                echo "${a} is not a number"
                break
        fi
        read -p "Say me the second number?" b
        if [[ $b =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
                echo "${b} is a number"
        else
                echo "${b} is not a number"
                break
        fi
        if [[ $op = '/' && $b =~ ^[+-]?[0]+([.][0]+)?$ ]]; then
                echo "dev by null"
                break
        fi
        ans=$(echo "$a $op $b" | bc -l)
        printf "%s %s %s = %s\n\n" "$a" "$op" "$b" "$ans"
break
done
