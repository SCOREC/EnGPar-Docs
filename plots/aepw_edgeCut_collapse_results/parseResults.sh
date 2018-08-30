#!/bin/bash 
file=$1
dir=$2

if [ $3 -eq 0 ]
then
    # Initial Imbalance 
    edgeimb=$(grep  "Edges type 0" $file | tr " " "\n" | fgrep . | awk 'NR % 8 == 4') 
    echo -n " $edgeimb" >> $dir/edgeimb_v_cores.dat
fi

# Element Imbalance 
edgeimb=$(grep  "Edges type 0" $file | tr " " "\n" | fgrep . | awk 'NR % 8 == 0') 
echo -n " $edgeimb" >> $dir/edgeimb_v_cores.dat


if [ $3 -eq 0 ]
then
    # Edge Cut
    cut=$(grep "Edge Cut" $file | tr " " "\n" | fgrep . | awk 'NR % 4 == 2')
    echo -n " $cut" >> $dir/edgecut_v_cores.dat
fi

# Edge Cut
cut=$(grep "Edge Cut" $file | tr " " "\n" | fgrep . | awk 'NR % 4 == 0')
echo -n " $cut" >> $dir/edgecut_v_cores.dat
