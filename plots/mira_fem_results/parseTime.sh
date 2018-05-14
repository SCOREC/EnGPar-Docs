#!/bin/bash

parma=$1
engpar=$2
engpar_time=$3
dir=$5

#Total Time
time=$(grep  "steps" $parma | tr " " "\n" | fgrep . | awk 'NR % 2 == 0' | awk '{s+=$1} END {print s}')
time="$4 $time $(grep  "Total Time" $engpar | tr " " "\n" | fgrep .)"
echo $time>>$dir/time_v_cores.dat

#Graph distance time
gd=$(grep "measureGraphDist" $parma | tr " " "\n" | fgrep . | awk '{s+=$1} END {print s}')
gd="$4 $gd $(grep "Distance Comp" $engpar_time | tr " " "\n" | fgrep .)"
echo $gd>>$dir/gd_v_cores.dat

#Migration time
gd=$(grep "migrated in" $parma | tr " " "\n" | fgrep . | awk '{s+=$1} END {print s}')
gd="$4 $gd $(grep "Migrating" $engpar_time | tr " " "\n" | fgrep . | awk '{s+=$1} END {print s}')"
echo $gd>>$dir/migrate_v_cores.dat

#Number of Steps
grep "steps" $parma | tr " " "\n" | awk 'NR % 11 == 5' | awk '{s+=$1} END {print s}'
grep "steps" $engpar_time | tr " " "\n" | awk 'NR % 11 == 6' | awk '{s+=$1} END {print s}'
