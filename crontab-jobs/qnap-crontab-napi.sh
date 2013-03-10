#!/bin/bash
 
movies="/share/Movies/movies-new"

FILE_TYPES="-name \"*.mkv\" -o -name \"*.avi\" "
find -L . \( ${FILE_TYPES} \)




search(){
  cd $movies
  for file in $(find -L . \( ${FILE_TYPES} \))
  do

    echo File: $file

  done
}


