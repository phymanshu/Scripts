#!/bin/bash
##################### Description ####################
# This script: 
#    - creates a list of all the AO2D.root files present in the $workDir  
#    - merge all these AO2D.root files using o2-aod-merger
# Load o2physics env before running the script!              
#######################################################

workDir=MC_train_109473
rm $workDir/listOfAO2D.txt
ls $(find $PWD/$workDir -name AO2D.root) > $workDir/listOfAO2D.txt
nAO2DFiles=$(cat $workDir/listOfAO2D.txt | wc -l)
echo ""
echo "Total $nAO2DFiles files are found in the $workDir/ directory!"
echo ""
rm $workDir/mergedAO2D_$workDir.root
o2-aod-merger --input $workDir/listOfAO2D.txt --output $workDir/mergedAO2D_$workDir.root
