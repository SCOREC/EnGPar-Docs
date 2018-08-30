#!/bin/bash

trial=trial$1
results=results$1
mkdir $results
echo "#Cores Initial Off 1.2 1.0 0.8" > $results/edgeimb_v_cores.dat
echo "#Cores Initial Off 1.2 1.0 0.8" > $results/edgecut_v_cores.dat
for i in 1024 2048 4096 8192
do
    echo -n $i >> $results/edgeimb_v_cores.dat
    echo -n $i >> $results/edgecut_v_cores.dat
    for j in 0 1.2 1.0 0.8
    do
        ./parseResults.sh $trial/aepw_${i}_$j.out $results $j
    done
    echo $EMPTY >> $results/edgeimb_v_cores.dat
    echo $EMPTY >> $results/edgecut_v_cores.dat
done

         
