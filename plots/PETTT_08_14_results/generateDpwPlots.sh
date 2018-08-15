./makeImbAndCutPlots.py -x "256 512 1024" \
-f "dpw/256.out dpw/512.out dpw/1024.out" \
-t "DPW Imbalance" -o nocollapse -s paper.mplstyle \
-c 12000 -v 1.06 -e 2.4
./makeImbAndCutPlots.py -x "256 512 1024" \
-f "dpw_collapsed/256.out dpw_collapsed/512.out dpw_collapsed/1024.out" \
-t "DPW Imbalance" -o collapse -s paper.mplstyle \
-c 12000 -v 1.06 -e 2.4
