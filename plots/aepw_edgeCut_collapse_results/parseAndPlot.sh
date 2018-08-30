#!/bin/bash

./parseAllResults.sh $1
gnuplot -e "prefix='results$1'" plot_eimb.gp
gnuplot -e "prefix='results$1'" plot_ecut.gp
