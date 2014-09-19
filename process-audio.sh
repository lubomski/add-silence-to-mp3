#!/bin/bash
 
# converts all .mp3 files in the subfolders of where
# this script is executed to contain 1 second of silence 
# at the start and end of the file.
#
# all converted files will be in the new subdirectory
# "converted" inside the directory where this script is
# executed; the original files will not be touched.
#
# you have to install sox prior to running this script
# http://sox.sourceforge.net/
#
# Author: Richard Lubomski | 2014-09-19
# bomski.com
 
 
#enable for loops over items with spaces in their name
IFS=$'\n'
 
if [ ! -d converted/ ]; then
 mkdir converted/
fi
for dir in *;
  do
  if [ ! $dir == "converted" ]; then
    if [ -d "./$dir" ]; then
     cd $dir
     
	read -p "WARNING: this will modify all .mp3 files contained within directories in \"$PWD\", Do you wish to proceed? (y/n)" CONT
	
	if [ "$CONT" == "y" ]; then
    
    echo "adding silence to start and end of .mp3 files in \"$PWD\"." 
     
     if [ ! -d ../converted/$dir ]; then
       mkdir ../converted/$dir
     fi
     
     for i in *.mp3; do
       echo "Converting Input File: \"./$dir/$i\"..."
       sox "$i" "../converted/$dir/$i" pad 1 1
       
       if [ $? -eq 0 ]
       then
         echo "Successfully converted File \"./$dir/$i\"."
       else
         echo "File \"./$dir/$i\" could not be converted. Aborting!"
         exit 1
       fi
     
     done
     
     echo "Converted all Files in \"./$dir\"."
     echo -e "\n"
     
     cd ..
     
     echo "SUCCESS! Modified .mp3 files can be found in \"$PWD/converted\"."

    fi 
     else
  	echo "ABORTING...";
	fi
  fi 
 
done
exit 0