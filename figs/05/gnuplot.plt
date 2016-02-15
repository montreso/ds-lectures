set term post eps color enhanced 20
set style line 1 lt 1 lc rgb "#000000" lw 4 pt 1 ps 1
set style line 2 lt 2 lc rgb "#800000" lw 4 pt 2 ps 1
set style line 3 lt 3 lc rgb "#000080" lw 4 pt 4 ps 1
set style line 4 lt 4 lc rgb "#008000" lw 4 pt 6 ps 1

set xlabel "Rounds"
set ylabel "s_t"
set logscale y
set key bottom left

plot [0:20][1E-50:1E1] \
  "gossip-data.txt" using 1:2 with lines ls 1 title "Pull",\
  "gossip-data.txt" using 1:3 with lines ls 2 title "Push"