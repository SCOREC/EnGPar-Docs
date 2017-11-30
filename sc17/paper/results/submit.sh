#!/bin/bash -e
[ $# -ne 3 ] && echo "Usage: $0 <cores> <ppn> <minutes>" && exit 1
cores=$1
ppn=$2
minutes=$3
[[ $ppn != 16 && $ppn != 32 && $ppn != 64 ]] && echo "invalid ppn specified $ppn" && exit 1
nodes=$((cores/ppn))
coresKi=$((cores/1024))

d=/projects/HighLift/cwsmith/phasta-boeing-1B
model=$d/translated-model.dmg
mesh64=$d/64Ki/reorderMdsMesh_bz2/
mesh128=$d/128Ki/mdsMesh_bz2/
mesh256=$d/256Ki/mdsMesh_bz2/
mesh512=/gpfs/mira-fs0/projects/HighLiftWing/mrasquin/Models/Boeing/Beta/Open27_B0_D30_U20/14-A2-12jets/ParmaTest2/chef/4k-4k-Sim-Adapt-6jets-UnsteadyBlowing-DDES-ts76800/8k-4k-chef-Tet-preRIBPostRIB1-SplitGlobalGraph1/512k-8k-chef-SplitLocalGraph1/mdsMesh_bz2/

mesh=mesh${coresKi}
tol=1.05

engpar=/gpfs/mira-home/cwsmith/projects/engpar-build-gcc/test/balanceMesh
parma=/gpfs/mira-home/cwsmith/projects/core-build-sim-off-gcc/test/vtxElmBalance
email=smithc11@rpi.edu
project=TRAssembly
render=0
BG_OPTS="BG_SHAREDMEMSIZE=64MB:PAMID_VERBOSE=1"
set -x
[ ! -d $coresKi ] && mkdir $coresKi
cd $coresKi
#qsub -t $minutes -n $nodes --mode c${ppn} -A $project -M $email --env $BG_OPTS \
#  $engpar $model bz2:${!mesh} $tol $render

qsub -t $minutes -n $nodes --mode c${ppn} -A $project -M $email --env $BG_OPTS \
  $parma $model bz2:${!mesh} ignored
set +x
