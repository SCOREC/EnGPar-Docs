#!/bin/bash

./parseAllResults.sh 2
gnuplot -e "prefix='results2_metric'" plot_eimb.gp
gnuplot -e "prefix='results2_metric'" plot_ecut.gp
gnuplot -e "prefix='results2_collapse'" plot_eimb_collapse.gp
gnuplot -e "prefix='results2_collapse'" plot_ecut_collapse.gp
