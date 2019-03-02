#!/bin/bash 
cat /dev/null > vtxLoc.log
cat /dev/null > vtxTot.log
cat /dev/null > edge.log
cat /dev/null > timeTot.log
cat /dev/null > timeBL.log
cat /dev/null > timeTet.log
cat /dev/null > timeInviscid.log
for i in {0..399}; do
  echo $i
  #combine all timers on each rank
  grep "Inviscid Jacobians" debug${i}.txt | awk '{ sum+=$6 } END { print sum }' >> timeInviscid.log
  grep "Viscous Jacobians(P" debug${i}.txt | awk '{ sum+=$6 } END { print sum }' >> timeBL.log
  grep "Viscous Jacobians(T" debug${i}.txt | awk '{ sum+=$6 } END { print sum }' >> timeTet.log
  grep -i "jacobians" debug${i}.txt | awk '{ sum+=$6 } END { print sum }' >> timeTot.log
  #post diffusion imbalance on each rank
  awk '/vtx local imb/ {print $4}' debug${i}.txt  | tail -n 1 >> vtxLoc.log
  awk '/vtx total imb/ {print $4}' debug${i}.txt  | tail -n 1 >> vtxTot.log
  awk '/edge type imb 0/ {print $5}' debug${i}.txt  | tail -n 1 >> edge.log
done
