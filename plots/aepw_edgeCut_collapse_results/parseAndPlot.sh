#!/bin/bash


./parseAllResults.sh $1 "$2"
gnuplot -e "prefix='results$1_metric'" plot_eimb.gp
gnuplot -e "prefix='results$1_metric'" plot_ecut.gp
gnuplot -e "prefix='results$1_collapse'" plot_eimb_collapse.gp
gnuplot -e "prefix='results$1_collapse'" plot_ecut_collapse.gp
