#!/bin/bash 
cat /dev/null > vtxLocCount.log
cat /dev/null > vtxTotCount.log
cat /dev/null > tetCount.log
cat /dev/null > blCount.log
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
  #post mesh entity count on each rank
  awk '/local nodes/ {print $8}' debug${i}.txt  >> vtxLocCount.log
  awk '/local nodes/ {print $8 + $9}' debug${i}.txt  >> vtxTotCount.log
  awk '/tet/ {print $7}' debug${i}.txt  | tail -n 1 >> tetCount.log
  awk '/pyr|prz/ {sum+=$7} END {print sum}' debug${i}.txt >> blCount.log
done
