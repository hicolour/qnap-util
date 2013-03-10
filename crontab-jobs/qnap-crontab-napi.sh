#!/bin/bash
 
movies="/share/Movies/movies-new"

FILE_TYPES="-name \"*.mkv\" -o -name \"*.avi\" "

#  for file in $(/opt/bin/find -L . \( ${FILE_TYPES} \))


search(){
  dir=$1
  type=$2
  echo "Find in "$dir  
  for file in $(find $dir -type f -name "*.$type")
  do

    echo File: $file

  done
}
echo init
search $movies mkv
