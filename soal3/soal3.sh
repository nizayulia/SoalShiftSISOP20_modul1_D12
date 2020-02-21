#bagian a
wget -a "wget.log" https://loremflickr.com/320/240/cat -O "pdkt_kusuma_$i"

#bagian b
5 6-23/8 * * 0-5 bash /home/yulia/Documents/M1/Shift/no3/no3.sh

#bagian c
mkdir kenangan
mkdir duplicate

cat wget.log | grep Location: > location.log

a=$(awk '{ a++
	print a " " $2 }' location.log )
echo "$a"
