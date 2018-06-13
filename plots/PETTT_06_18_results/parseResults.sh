#!/bin/bash 
engpar=$1
dir=$2

# Vertex Imbalance
vtximb=$(grep  "Local Vertex Imbalance" $engpar | tr " " "\n" | fgrep . | awk 'NR % 4 == 0') 
vtximb="$3 $vtximb"
echo $vtximb >> $dir/vtximb_v_cores.dat

vtximb=$(grep  "Total Vertex Imbalance" $engpar | tr " " "\n" | fgrep . | awk 'NR % 4 == 0') 
vtximb="$3 $vtximb"
echo $vtximb >> $dir/gstvtx_v_cores.dat

# Edge Imbalance
elmimb=$(grep  "Edges type 0:" $engpar | tr " " "\n" | fgrep . | awk 'NR % 4 == 0') 
elmimb="$3 $elmimb"
echo $elmimb >> $dir/elmimb_v_cores.dat
