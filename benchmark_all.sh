#!/bin/bash

EXPERIMENT_NAME="radiomicsJ"

DATADIR="/home/jesse/Desktop/mini_tissuenet/"
OUTFILE="out"
ls -s -a $DATADIR

#=== Request echoing of each command executed
set -x
date

declare -a arr=(
    "GLCM"
    "Morphological"
    "GLDZM"
    "NGLDM"
    "Shape2D"
    "IntensityBasedStatistics"
    "GLSZM"
    "IntensityHistogram"
    "Fractal"
    "Diagnostics"
    "NGTDM"
    "LocalIntensityFeatures"
    "ALL"
)

mkdir out

> timing_$EXPERIMENT_NAME.txt

for i in "${arr[@]}"
do 
    touch out/"$i.csv"

    start=$(date +%s)

    java -jar target/RadiomicsJ-jar-with-dependencies.jar -i $DATADIR/int -m $DATADIR/seg -o $OUTFILE/"$i.csv" -features "$i"

    end=$(date +%s)
    echo "$i: $EXPERIMENT_NAME Elapsed Time: $(($end-$start)) seconds"
    echo "$i: $EXPERIMENT_NAME Elapsed Time: $(($end-$start)) seconds" >> timing_$EXPERIMENT_NAME.txt

done 

date

