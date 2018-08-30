if (!exists("prefix")) exit
set xrange [-0.25:3.25]
set yrange [10000000:36000000]
set xlabel "Processes" font ",40"
set ylabel "Total Edge Cut" font ",40"
set term postscript eps color blacktext "Helvetica" 20
set output "ecut_v_cores.eps"
set key left top font ",15" samplen 4 spacing 2
set style line 1 lc rgb '#e41a1c' lt 1 lw 7 pt 7 ps 3.5
set style line 2 lc rgb '#377eb8' lt 1 lw 7 pt 9 ps 3.5
set style line 3 lc rgb '#4daf4a' lt 1 lw 7 pt 5 ps 3.5
set style line 4 lc rgb '#984ea3' lt 1 lw 7 pt 3 ps 3.5
set style line 5 lc rgb '#ff7f00' lt 1 lw 7 pt 1 ps 3.5
set style line 6 lc rgb '#ffff33' lt 1 lw 7 pt 2 ps 3.5
set style line 7 lc rgb '#a65628' lt 1 lw 7 pt 4 ps 3.5
set style line 8 lc rgb '#f781bf' lt 1 lw 7 pt 6 ps 3.5

plot prefix."/edgecut_v_cores.dat" using 2:xticlabels(1) with lp title 'Initial' ls 1, \
     ""                  using 3:xticlabels(1) with lp title 'Off'  ls 2, \
     ""                  using 6:xticlabels(1) with lp title '1.2'  ls 3 , \
     ""                  using 7:xticlabels(1) with lp title '1.0'  ls 4 , \
     ""                  using 8:xticlabels(1) with lp title '0.8'  ls 5
               
