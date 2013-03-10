#!/bin/bash
 
movies="/share/Movies/movies-new"

FILE_TYPES="-name \"*.mkv\" -o -name \"*.avi\" "




search(){
  cd $movies
  echo Find in $(pwd)
  for file in $(/opt/bin/find -L . \( ${FILE_TYPES} \))
  do

    echo File: $file

  done
}
echo init
search
