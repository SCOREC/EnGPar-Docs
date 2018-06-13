#!/bin/bash

./parseAllResults.sh $1
gnuplot -e "prefix='results_$1'" plot_vimb.gp
gnuplot -e "prefix='results_$1'" plot_eimb.gp
