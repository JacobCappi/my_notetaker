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
    NOTES=()

    for FILE in ${DIRS[$INPUT]}/*; do
        [[ -f $FILE ]] && NOTES+=("$FILE")
    done

    for i in "${!NOTES[@]}"; do
        printf "%s. %s\n" "$i" "${NOTES[$i]}"
    done

    echo "${#NOTES[@]}. [ make new note ]"

    read INDEX

    if [[ $INDEX -eq ${#NOTES[@]} ]]
    then
        IFS= read -r -p "Enter Note Name: " NOTENAME
        vim ${DIRS[$INPUT]}/$(date +%F)_$NOTENAME
    elif [[ $INDEX -lt ${#NOTES[@]} ]]
    then
        vim "${NOTES[INDEX]}"
    else
        echo "Invalid Input"
    fi
else
    echo "Invalid Input"
fi
