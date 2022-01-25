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

IFS=$'\n'
if [[ $INPUT -eq ${#DIRS[@]} ]]
then
    IFS= read -r -p "Enter Directory Name: " DIRNAME
    mkdir ~/Notes/$DIRNAME
    IFS= read -r -p "Enter Note Name: " NOTENAME
    vim ~/Notes/$DIRNAME/$(date +%F)_$NOTENAME
elif [[ $INPUT -lt ${#DIRS[@]} ]]
then
    IFS= read -r -p "Enter Note Name: " NOTENAME
    vim ${DIRS[$INPUT]}/$(date +%F)_$NOTENAME
else
    echo "Invalid Input"
fi
