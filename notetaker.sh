#!/bin/bash

DIRS=()

for FILE in ~/Notes/*; do
    [[ -d $FILE ]] && DIRS+=("$FILE")
done

for i in "${!DIRS[@]}"; do
    printf "%s. %s\n" "$i" "${DIRS[$i]}"
done

echo "${#DIRS[@]}. [ make new label ]"

read INPUT

if [[ $INPUT -eq ${#DIRS[@]} ]]
then
    echo "Name the Dir: "
    read DIRNAME
    mkdir ~/Notes/$DIRNAME
    echo "Name the Note"
    read NOTENAME
    vim "~/Notes/$DIRNAME/$(date +%F)_$NOTENAME"
elif [[ $INPUT -lt ${#DIRS[@]} ]]
then
    echo "Name the Note"
    read NOTENAME
    vim "~/Notes/$DIRNAME/$(date +%F)_$NOTENAME"
else
    echo "Invalid Input"
fi
