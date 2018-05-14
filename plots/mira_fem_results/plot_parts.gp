if (!exists("prefix")) exit
set title "Breakdown of EnGPar Timing"
set yrange [0:8]
#set xrange [-0.5:2.5]
set xlabel "Processes(Ki)"
set ylabel "Time(seconds)"
set style histogram clustered gap 1 title textcolor lt -1
set style data boxes
set style fill solid border -1
set key top center
set term postscript eps color blacktext "Helvetica" 24
set output "timeparts_v_cores.eps"
set boxwidth 0.3 relative
set style fill pattern border -1
set style line 1 lc rgb '#d7191c' lt 1 lw 3
set style line 2 lc rgb '#2b83ba' lt 1 lw 3
set style line 3 lc rgb '#fdae61' lt 1 lw 3
set style line 4 lc rgb '#abdda4' lt 1 lw 3

plot prefix.'/timeparts_v_cores.dat' u (log($1)/log(2)-.3):2 title 'Construction' \
     ls 1 fill pattern 3,\
     ''                     u (log($1)/log(2)):3:xtic(1) title 'Balancing'\
     ls 2 fill pattern 2,\
     ''                     u (log($1)/log(2)+.3):4 title 'Repartition'\
     ls 3 fill pattern 3,\
     prefix.'/migrate_v_cores.dat'    u (log($1)/log(2)):3 title 'Migration' \
     ls 4  fill pattern 1
