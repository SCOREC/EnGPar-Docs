#!/bin/bash 
echo "#Cores ParMA EnGPar">time_v_cores.dat
echo "#Cores ParMA EnGPar">gd_v_cores.dat
echo "#Cores ParMA EnGPar">migrate_v_cores.dat
echo "#Cores Construct Balancing Repartition">timeparts_v_cores.dat
echo "#Cores Original ParMA EnGPar">vtximb_v_cores.dat
echo "#Cores Original ParMA EnGPar">elmimb_v_cores.dat
echo "#Cores Original ParMA EnGPar">numvtx_v_cores.dat

for i in {128,256,512}
do
    p_outputs=($i/parma/*.output)
    e_outputs=($i/engpar/timing/*.output) 
    ./parseResults.sh ${p_outputs[-1]} ${e_outputs[-1]} $i
    e2_outputs=($i/engpar/timing/*.output)
    p_outputs=($i/parma/timing/*.output) 
    ./parseTime.sh ${p_outputs[-1]} ${e_outputs[-1]} ${e2_outputs[-1]} $i
done
