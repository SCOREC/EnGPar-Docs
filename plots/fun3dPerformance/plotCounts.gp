set style line 1 lc rgb '#e41a1c' lt 1 lw 7 pt 7 ps 1
set style line 2 lc rgb '#984ea3' lt 1 lw 7 pt 7 ps 1

set title "Post EnGPar Vtx>Elm: Mesh Entity Counts versus Time" font ",20"
set xlabel "process" font ",20"
set ylabel "time (s)" font ",20"
set y2label "imbalance (max/avg)" font ",20"
set y2tics font ",20"
set key left font ",20"
set term postscript eps color blacktext "Helvetica" 20
set output "postEngpar_countVsImbalance.eps"
set key outside center bottom horizontal font ",16"
p 'vtxTotCount.log' title "Vtx Count" axis x1y2, \
  'tetCount.log' title "Tet Count" axis x1y2, \
  'blCount.log' title "Pyr+Prz Count" axis x1y2, \
  'timeTet.log' title "viscous tet" ls 2, \
  'timeInviscid.log' title "inviscid", \
  'timeBL.log' title "viscous prz and pyr", \
  'timeTot.log' title "viscous and inviscid" ls 1
