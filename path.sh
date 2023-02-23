#!/bin/bash
echo "Write the absolute path to the directory you want to create, username!"
read path
echo "You want to create - $path? Press the Y key to continue..."
read key
if [[ $key == 'y' ]]; then
        echo "continued...";
fi;
if [[ -d $path ]]; then
        echo "The directory $path is already exists!"
else
        mkdir $path && echo "The directory $path created!"
fi;
