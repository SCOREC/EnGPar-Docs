if (!exists("prefix")) exit
set yrange [0:15]
set xrange [-0.5:2.5]
set xlabel "Processes(Ki)" font ",40"
set ylabel "Time(seconds)" font ",40"
set term postscript eps color blacktext "Helvetica" 24
set output "time_v_cores.eps"
set key right font ",30"
set style line 2 lc rgb '#e41a1c' lt 1 lw 15 pt 7 ps 4.5   # --- blue
set style line 1 lc rgb '#377eb8' lt 1 lw 15 pt 9 ps 4.5   # --- red
set style line 3 lc rgb '#4daf4a' lt 1 lw 15 pt 5 ps 4.5   # --- red
set style line 4 lt 2 lw 10 lc rgb '#377eb8'
plot prefix."/time_v_cores.dat" using 3:xticlabels(1) with lp title 'EnGPar' ls 2  


