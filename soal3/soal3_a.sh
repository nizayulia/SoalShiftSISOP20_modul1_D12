#! bin/bash

for ((i=1; i<=28; i=i+1))
do 
 wget -a "wget.log" https://loremflickr.com/320/240/cat -O "pdkt_kusuma_$i"
done

# -O ganti nama
# -a append output logfile
