#!/bin/bash
while true; do
        read -p "Say me the first number?" a
        if [[ $a =~ ^[0-9]+$ ]]; then
                echo "${a} is a number"
        else
                echo "${a} is not a number"
                break
        fi
        read -p "Say me the second number?" b
        if [[ $b =~ ^[0-9]+$ ]]; then
                echo "${b} is a number"
        else
                echo "${b} is not a number"
                break
        fi
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
        ans=$(echo "$a $op $b" | bc -l)
        printf "%s %s %s = %s\n\n" "$a" "$op" "$b" "$ans"
        break
done
