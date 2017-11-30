set title "Total Migration Time"
set yrange [0:6.5]
set xrange [-0.5:2.5]
set xlabel "Processes(Ki)"
set ylabel "Time(seconds)"
set term postscript eps color blacktext "Helvetica" 24
set output "migrate_v_cores.eps"
set key right
set style line 1 lc rgb '#d7191c' lt 1 lw 7 pt 7 ps 2.5   # --- blue
set style line 2 lc rgb '#abdda4' lt 1 lw 7 pt 9 ps 3   # --- red
plot "migrate_v_cores.dat" using 2:xticlabels(1) with lp title 'ParMA migration' ls 1, \
     ""                   using 3:xticlabels(1) with lp title 'EnGPar migration' ls 2, \
