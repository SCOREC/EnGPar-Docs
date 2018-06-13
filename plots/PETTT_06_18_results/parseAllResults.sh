#!/bin/bash
dir=results_$1
echo "#Cores ParMETIS EnGPar">$dir/vtximb_v_cores.dat
echo "#Cores ParMETIS EnGPar">$dir/elmimb_v_cores.dat
echo "#Cores ParMETIS EnGPar">$dir/gstvtx_v_cores.dat

for i in {128,256,512,1024}
do
    file=$1/dpw_PETTT_$i.log
    ./parseResults.sh $file $dir $i
done
