#!/bin/bash

trial=trial2
results=results2
if [ ! -d ${results}_metric ]; then
    mkdir ${results}_metric
fi
if [ ! -d ${results}_collapse ]; then
    mkdir ${results}_collapse
fi
echo "#Cores Initial Off 2.0 1.5 1.2 1.0 0.8 0.5" > ${results}_metric/edgeimb_v_cores.dat
echo "#Cores Initial Off 2.0 1.5 1.2 1.0 0.8 0.5" > ${results}_metric/edgecut_v_cores.dat
echo "#Cores Initial_Uncollapse Uncollapse Initial_Collapsed Collapsed" \
     > ${results}_collapse/edgeimb_v_cores.dat
echo "#Cores Initial_Uncollapse Uncollapse Initial_Collapsed Collapsed" \
     > ${results}_collapse/edgecut_v_cores.dat

for i in 1024 2048 4096 8192
do
    echo -n $i >> ${results}_metric/edgeimb_v_cores.dat
    echo -n $i >> ${results}_metric/edgecut_v_cores.dat
    for j in 0 2.0 1.5 1.2 1.0 0.8 0.5
    do
        ./parseResults.sh $trial/aepw_${i}_$j.out ${results}_metric $j 
    done
    echo $EMPTY >> ${results}_metric/edgeimb_v_cores.dat
    echo $EMPTY >> ${results}_metric/edgecut_v_cores.dat
done

for i in 1024 2048 4096 8192
do
    echo -n $i >> ${results}_collapse/edgeimb_v_cores.dat
    echo -n $i >> ${results}_collapse/edgecut_v_cores.dat
    for j in aepw aepw_collapsed
    do
        ./parseResults.sh $trial/${j}_${i}_0.out ${results}_collapse 0
    done
    echo $EMPTY >> ${results}_collapse/edgeimb_v_cores.dat
    echo $EMPTY >> ${results}_collapse/edgecut_v_cores.dat
done
         
