set title "Vertex Imbalance vs. Processes"
set yrange [1:1.55]
set xrange [-0.5:2.5]
set xlabel "Processes(Ki)"
set ylabel "Vertex Imbalance"
set term postscript eps color blacktext "Helvetica" 24
set output "vimb_v_cores.eps"
set key left
set style line 1 lc rgb '#d7191c' lt 1 lw 7 pt 7 ps 2.5   # --- blue
set style line 2 lc rgb '#abdda4' lt 1 lw 7 pt 9 ps 3   # --- red
set style line 3 lc rgb '#fdae61' lt 1 lw 7 pt 5 ps 2.5   # --- red
set style line 4 lt 2 lw 7 lc rgb '#2b83ba'
plot "vtximb_v_cores.dat" using 3:xticlabels(1) with lp title 'ParMA' ls 1, \
     ""                  using 4:xticlabels(1) with lp title 'EnGPar' ls 2, \
     ""                  using 2:xticlabels(1) with lp title 'Initial' ls 3, \
      1.05 with lines title 'Tolerance' ls 4
