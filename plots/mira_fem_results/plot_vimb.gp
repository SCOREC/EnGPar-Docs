if (!exists("prefix")) exit
set yrange [1:1.55]
set xrange [-0.5:2.5]
set xlabel "Processes(Ki)" font ",40"
set ylabel "Vertex Imbalance" font ",40"
set term postscript eps color blacktext "Helvetica" 24
set output "vimb_v_cores.eps"
set key left font ",30"
set style line 1 lc rgb '#e41a1c' lt 1 lw 7 pt 7 ps 4
set style line 2 lc rgb '#377eb8' lt 1 lw 7 pt 9 ps 4
set style line 3 lc rgb '#984ea3' lt 1 lw 7 pt 5 ps 4
set style line 4 lt 5 lw 5 lc rgb '#4daf4a'

plot prefix."/vtximb_v_cores.dat" using 2:xticlabels(1) with lp title 'Initial' ls 3, \
     ""                           using 4:xticlabels(1) with lp title 'EnGPar' ls 1, \
     ""                           using 3:xticlabels(1) with lp title 'ParMA' ls 2, \
     1.05 with lines title 'Tolerance' ls 4
