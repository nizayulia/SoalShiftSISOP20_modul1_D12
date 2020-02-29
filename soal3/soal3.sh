#bagian a
for ((i=1; i<=28; i=i+1))
do 
 wget -a "wget.log" https://loremflickr.com/320/240/cat -O "pdkt_kusuma_$i"
done

#bagian b
5 6-23/8 * * 0-5 bash /home/yulia/Documents/M1/Shift/no3/no3.sh

#bagian c
mkdir -p duplicate kenangan
cat wget.log | grep Location: > location.log

awk '{
	a++
	print a ";" $2
}' location.log | 

awk -F ';' '{
	countt[$2]++
	if (countt[$2] > 1) {
		maka = "mv pdkt_kusuma_" $1 " duplicate/duplicate_" $1
	} else {
		maka = "mv pdkt_kusuma_" $1 " kenangan/kenangan_" $1
	}
	system(maka)
}'

cat location.log >> location.log.bak
> location.log

cat wget.log >> wget.log.bak
> wget.log
