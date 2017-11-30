#!/bin/bash

./parseAllResults.sh
gnuplot plot_time.gp
gnuplot plot_vimb.gp
gnuplot plot_eimb.gp
gnuplot plot_parts.gp
gnuplot plot_gd.gp
gnuplot plot_migrate.gp
