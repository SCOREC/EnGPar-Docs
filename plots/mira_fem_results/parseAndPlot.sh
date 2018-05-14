#!/bin/bash

./parseAllResults.sh $1
gnuplot -e "prefix='results$1'" plot_time.gp
gnuplot -e "prefix='results$1'" plot_vimb.gp
gnuplot -e "prefix='results$1'" plot_eimb.gp
gnuplot -e "prefix='results$1'" plot_parts.gp
gnuplot -e "prefix='results$1'" plot_gd.gp
gnuplot -e "prefix='results$1'" plot_migrate.gp
