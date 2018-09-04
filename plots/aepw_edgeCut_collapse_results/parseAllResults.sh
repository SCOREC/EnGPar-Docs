#!/bin/bash

trial=trial$1
results=results$1
if [ ! -d ${results}_metric ]; then
    mkdir ${results}_metric
fi
if [ ! -d ${results}_collapse ]; then
    mkdir ${results}_collapse
fi
if [ $1 -eq 2 ]; then
    AEPW=aepw
elif [ $1 -eq 3 ]; then
    AEPW=aepw_edges
fi
echo "Cores Initial Off $2" > ${results}_metric/edgeimb_v_cores.dat
echo "Cores Initial Off $2" > ${results}_metric/edgecut_v_cores.dat
echo "Cores Initial Off $2" > ${results}_collapse/edgeimb_v_cores.dat
echo "Cores Initial Off $2" > ${results}_collapse/edgecut_v_cores.dat

for i in 1024 2048 4096 8192
do
    echo -n $i >> ${results}_metric/edgeimb_v_cores.dat
    echo -n $i >> ${results}_metric/edgecut_v_cores.dat
    for j in 0 $2
    do
        ./parseResults.sh $trial/${AEPW}_${i}_$j.out ${results}_metric $j
    done
    echo $EMPTY >> ${results}_metric/edgeimb_v_cores.dat
    echo $EMPTY >> ${results}_metric/edgecut_v_cores.dat
done

for i in 1024 2048 4096 8192
do
    echo -n $i >> ${results}_collapse/edgeimb_v_cores.dat
    echo -n $i >> ${results}_collapse/edgecut_v_cores.dat
    for j in 0 $2
    do
        ./parseResults.sh $trial/${AEPW}_collapsed_${i}_$j.out ${results}_collapse $j
    done
    echo $EMPTY >> ${results}_collapse/edgeimb_v_cores.dat
    echo $EMPTY >> ${results}_collapse/edgecut_v_cores.dat
done
         
