 #! bin/bash

	awk -F "	" 'BEGIN { OFS= "\t"}
	{ if ($13 == "Central" && ( $11 == "Illinois" || "Texas" ) && $17 != "Product Name" )
	 arr[$17]+=$21;}
	END {for (res in arr) print arr[res] , res }
       ' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk 'BEGIN {FS="\t"} (NR <=10) {print $2}'
