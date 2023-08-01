#!/bin/bash
#####################
#  run: $ source getFilesFromAlien.sh fileListAlien.txt AO2D.root
#  first arg:   a txt file contains the paths from `alien`
#  second arg:  file you want to download, e.g., AO2D.root or AnalysisResults.root
#               If you dont specify second arg, it will download everything present in that alien directory.
######################

inputFileList=$1
rootFileName=$2
dirCount=1

if [ $# -eq 0 ]
  then
        echo ""
        echo "Please provide the input file as a First argument!!"
        echo "Nothing to do..."
        echo ""
        return
fi

for line in $(cat "$inputFileList")
do
        mkdir Dir$dirCount
        cd Dir$dirCount
        alien_cp alien://$line file:. -name contain_$rootFileName
        dirCount=$((dirCount+1))
        cd ../
done
