#!/bin/bash
dir=results$1
echo "#Cores ParMA EnGPar">$dir/time_v_cores.dat
echo "#Cores ParMA EnGPar">$dir/gd_v_cores.dat
echo "#Cores ParMA EnGPar">$dir/migrate_v_cores.dat
echo "#Cores Construct Balancing Repartition">$dir/timeparts_v_cores.dat
echo "#Cores Original ParMA EnGPar">$dir/vtximb_v_cores.dat
echo "#Cores Original ParMA EnGPar">$dir/elmimb_v_cores.dat
echo "#Cores Original ParMA EnGPar">$dir/numvtx_v_cores.dat

for i in {128,256,512}
do
    p_outputs=(trial$1/$i/parma/*.output)
    e_outputs=(trial$1/$i/engpar/timing/*.output) 
    ./parseResults.sh ${p_outputs[-1]} ${e_outputs[-1]} $i $dir
    e2_outputs=(trial$1/$i/engpar/timing/*.output)
    p_outputs=(trial$1/$i/parma/timing/*.output) 
    ./parseTime.sh ${p_outputs[-1]} ${e_outputs[-1]} ${e2_outputs[-1]} $i $dir
done
