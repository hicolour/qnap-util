#!/bin/bash
 
download="/share/Download/music"
discography="/share/Music/discography"

#enable for loops over items with spaces in their name
IFS=$'\n'
TRUE=TRUE
FALSE=FALSE
for dir in `ls  "$download/"`
do
  
  if [[ $dir =~ [.]rar ]]
  then
      echo ------------------------------------------------------------
      echo Removing archive $dir
      rm $download/$dir
      echo ------------------------------------------------------------
  else
        echo ------------------------------------------------------------
        echo Parsing Album $dir
        
        artist=`echo ${dir% - *}`
        title_with_date=`echo ${dir#* - }`
        title=`echo ${title_with_date%(*}`

        echo $artist
        echo $title
        
        exist=$FALSE
        for d in `ls  "$discography/"`
          do
              if [ $d = $artist ]
              then
                $exist=$TRUE
              fi  
          done
       
        if [ $exist = $TRUE ]
        then
            echo ------------------------------------------------------------
            echo Discography contains artist: $artist
        else
          echo ------------------------------------------------------------
          echo Discography not contains artist $artist and will be added
          mkdir $discography/$artist

        fi
        
        echo ------------------------------------------------------------
        echo Fianlly moving new album: $album to dir: $discography/$artist
        mv $download/$dir $discography/$artist/
        echo ------------------------------------------------------------
        echo Done for album: : $album to dir: $discography/$artist

  fi
done
echo  ------------------------------------------------------------
echo All Done!
echo ------------------------------------------------------------
