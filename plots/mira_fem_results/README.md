submit.sh - script used on Mira to run tests
<N>/engpar - engpar results at N Ki processes
<N>/parma - engpar result at N Ki processes

The parma and engpar executables were compiled and linked with GCC.

All runs used 64 processes per node.


To build plots:
./parseAndPlot.sh <trial number = 1/2>

Trial 1 is the results for SC17 workshop paper (sc17/paper)
Trial 2 is the improved results for SC18 workshop paper (scala18)
Note trial 2 is missing the in depth timing data that is plotted with trial 1
and `parseAndPlot.sh` will produce the following output with some warnings that
can be safely ignored:

```
$ ./parseAndPlot.sh 2
7
8
6
7
18
18
"plot_parts.gp", line 27: warning: Skipping data file with no valid points
"plot_parts.gp", line 27: warning: Skipping data file with no valid points
"plot_gd.gp", line 13: warning: Skipping data file with no valid points
"plot_gd.gp", line 13: warning: Skipping data file with no valid points
"plot_migrate.gp", line 13: warning: Skipping data file with no valid points
```

