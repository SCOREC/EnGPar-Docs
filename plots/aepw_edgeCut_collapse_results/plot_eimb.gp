if (!exists("prefix")) exit
set xrange [-0.25:3.25]
set auto fix
set offset 0, 0, graph .25, graph .05
set xlabel "Processes" font ",40"
set ylabel "Element Imbalance" font ",40"
set term postscript eps color blacktext "Helvetica" 20
set output "eimb_v_cores.eps"
set key top maxrows 2 font ",15" samplen 4 spacing 2.5
set style line 1 lc rgb '#e41a1c' lt 1 lw 7 pt 7 ps 3.5
set style line 2 lc rgb '#377eb8' lt 1 lw 7 pt 9 ps 3.5
set style line 3 lc rgb '#4daf4a' lt 1 lw 7 pt 5 ps 3.5
set style line 4 lc rgb '#984ea3' lt 1 lw 7 pt 3 ps 3.5
set style line 5 lc rgb '#ff7f00' lt 1 lw 7 pt 1 ps 3.5
set style line 6 lc rgb '#999999' lt 1 lw 7 pt 11 ps 3.5
set style line 7 lc rgb '#a65628' lt 1 lw 7 pt 13 ps 3.5
set style line 8 lc rgb '#f781bf' lt 1 lw 7 pt 15 ps 3.5
set key autotitle columnhead

plot prefix."/edgeimb_v_cores.dat" using 2:xticlabels(1) with lp ls 1, \
     ""                  using 3:xticlabels(1) with lp ls 2, \
     ""                  using 4:xticlabels(1) with lp ls 3, \
     ""                  using 5:xticlabels(1) with lp ls 4, \
     ""                  using 6:xticlabels(1) with lp ls 5, \
     ""                  using 7:xticlabels(1) with lp ls 8