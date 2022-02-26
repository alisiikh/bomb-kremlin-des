#!/bin/bash

IN="websites.txt"
while IFS= read -r LINE
do
  docker run -dti --rm alpine/bombardier -c 1000 -d 3600s -l "$LINE"
done < "$IN"
