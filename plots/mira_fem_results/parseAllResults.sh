#!/bin/bash
dir=results$1
[ ! -e $dir ] && mkdir $dir
echo "#Cores ParMA EnGPar">$dir/time_v_cores.dat
echo "#Cores ParMA EnGPar">$dir/gd_v_cores.dat
echo "#Cores ParMA EnGPar">$dir/migrate_v_cores.dat
echo "#Cores Construct Balancing Repartition">$dir/timeparts_v_cores.dat
echo "#Cores Original ParMA EnGPar">$dir/vtximb_v_cores.dat
echo "#Cores Original ParMA EnGPar">$dir/elmimb_v_cores.dat
echo "#Cores Original ParMA EnGPar">$dir/numvtx_v_cores.dat

for i in {128,256,512}
do
    p_outputs=(parma/$i/*.output)
    len=${#p_outputs[@]}; p_last=$((len-1))
    e_outputs=(trial$1/$i/engpar/timing/*.output) 
    len=${#e_outputs[@]}; e_last=$((len-1))
    ./parseResults.sh ${p_outputs[$p_last]} ${e_outputs[$e_last]} $i $dir
    e2_outputs=(trial$1/$i/engpar/timing/*.output)
    len=${#e2_outputs[@]}; e2_last=$((len-1))
    ./parseTime.sh ${p_outputs[$p_last]} ${e_outputs[$e_last]} ${e2_outputs[$e2_last]} $i $dir
done
