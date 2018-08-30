if (!exists("prefix")) exit
set xrange [-0.25:3.25]
set yrange [1.65:2.1]
set xlabel "Processes" font ",40"
set ylabel "Element Imbalance" font ",40"
set term postscript eps color blacktext "Helvetica" 20
set output "eimb_v_cores.eps"
set key top maxrows 1 font ",15" samplen 3 spacing 2
set style line 1 lc rgb '#e41a1c' lt 1 lw 15 pt 7 ps 4.5
set style line 2 lc rgb '#377eb8' lt 1 lw 15 pt 9 ps 4.5
set style line 3 lc rgb '#4daf4a' lt 1 lw 15 pt 5 ps 4.5
set style line 4 lc rgb '#984ea3' lt 1 lw 15 pt 3 ps 4.5
set style line 5 lc rgb '#ff7f00' lt 1 lw 15 pt 1 ps 4.5

plot prefix."/edgeimb_v_cores.dat" using 2:xticlabels(1) with lp title 'Initial' ls 5, \
     ""                  using 3:xticlabels(1) with lp title 'Off'  ls 1, \
     ""                  using 4:xticlabels(1) with lp title '1.2' ls 2 , \
     ""                  using 5:xticlabels(1) with lp title '1.0' ls 3 , \
     ""                  using 6:xticlabels(1) with lp title '0.8' ls 4
               
