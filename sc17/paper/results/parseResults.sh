#!/bin/bash 
parma=$1
engpar=$2

# Vertex Imbalance
vtximb=$(grep  "l entity imbalance" $parma | tr " " "\n" | fgrep . | awk 'NR % 4 == 1') 
vtximb="$3 $vtximb $(grep  "entity imbalance" $engpar | tr " " "\n" | fgrep . | awk 'NR % 8 == 5')"
echo $vtximb >> vtximb_v_cores.dat

# Element Imbalance
elmimb=$(grep  "l entity imbalance" $parma | tr " " "\n" | fgrep . | awk 'NR % 4 == 0') 
elmimb="$3 $elmimb $(grep  "entity imbalance" $engpar | tr " " "\n" | fgrep . | awk 'NR % 8 == 0')"
echo $elmimb >> elmimb_v_cores.dat

# Average Number of vtxs

numvtx=$(grep "l weighted vtx" $parma | tr " " "\n" |fgrep . | fgrep -v ".0")
numvtx="$3 $numvtx $(grep 'weighted vtx' $engpar | tr ' ' '\n' | fgrep . | fgrep -v '.0' | awk 'NR % 2 == 0')"
echo $numvtx  >> numvtx_v_cores.dat

#Seperate EnGPar Times
time2=$(grep "Construct Time" $engpar | tr " " "\n" | fgrep .)
time2="$3 $time2 $(grep "Balancing Time" $engpar | tr " " "\n" | fgrep .)"
time2="$time2 $(grep "Repartition Time" $engpar | tr " " "\n" | fgrep .)"
echo $time2>>timeparts_v_cores.dat
