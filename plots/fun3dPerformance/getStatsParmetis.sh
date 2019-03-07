#!/bin/bash 
cat /dev/null > vtxLocCount.log
cat /dev/null > vtxTotCount.log
cat /dev/null > tetCount.log
cat /dev/null > blCount.log
cat /dev/null > timeTot.log
cat /dev/null > timeBL.log
cat /dev/null > timeTet.log
cat /dev/null > timeInviscid.log

function getLines() {
    grep "= $1 " $2
}
for i in {0..399}; do
  echo $i
  #combine all timers on each rank
  getLines $i run.*.parmetis.1 | grep "Inviscid Jacobians" | awk '{ sum+=$6 } END { print sum }' >> timeInviscid.log
  getLines $i run.*.parmetis.1 | grep "Viscous Jacobians(P" | awk '{ sum+=$6 } END { print sum }' >> timeBL.log
  getLines $i run.*.parmetis.1 | grep "Viscous Jacobians(T" | awk '{ sum+=$6 } END { print sum }' >> timeTet.log
  getLines $i run.*.parmetis.1 | grep -i "jacobians" | awk '{ sum+=$6 } END { print sum }' >> timeTot.log
  #post mesh entity count on each rank
  getLines $i run.*.parmetis.1 | awk '/local nodes/ {print $8}' >> vtxLocCount.log
  getLines $i run.*.parmetis.1 | awk '/local nodes/ {print $8 + $9}' >> vtxTotCount.log
  getLines $i run.*.parmetis.1 | awk '/tet/ {print $7}' | tail -n 1 >> tetCount.log
  getLines $i run.*.parmetis.1 | awk '/pyr|prz/ {sum+=$7} END {print sum}' >> blCount.log
done
