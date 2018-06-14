if (!exists("prefix")) exit
set title "Mesh Edge Imbalance" font ",40"
set xrange [-0.25:3.25]
set yrange [1:1.8]
set xlabel "Processes" font ",40"
set ylabel "Edge Imbalance" font ",40"

set term postscript eps color blacktext "Helvetica" 24
set output prefix."/eimb_v_cores.eps"
set key left font ",30"
set style line 2 lc rgb '#e41a1c' lt 1 lw 15 pt 7 ps 4.5   # --- blue
set style line 1 lc rgb '#377eb8' lt 1 lw 15 pt 9 ps 4.5   # --- red
set style line 3 lc rgb '#4daf4a' lt 1 lw 15 pt 5 ps 4.5   # --- red
set style line 4 lt 2 lw 10 lc rgb '#377eb8'

plot prefix."/elmimb_v_cores.dat" using 3:xticlabels(1) with lp title 'EnGPar'  ls 2, \
     ""                  using 2:xticlabels(1) with lp title 'Initial' ls 3 , \
     1.05 with lines title 'Target' ls 4
               
