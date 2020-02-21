  #! bin/bash

	a=$(awk -F "	" '
	{ if( $13 != "Region" ) arr[$13]+=$21;}
	END {for (res in arr) printf res "\n" }
	' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | head -1 )
	echo "$a"

	b=$(awk -F "	" -v a="$a" '
	{ if ($13 == a && $11!=State) arr[$11]+=$21;}
	END {for (res in arr)
		print arr[res],res
	     }
       ' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk '(NR <=2) {print $2}' ) 
	echo "$b"

	awk -F "	" 'BEGIN { OFS= "\t"}
	{ if ($13 == "Central" && ( $11 == "Illinois" || "Texas" ) && $17 != "Product Name" )
	 arr[$17]+=$21;}
	END {for (res in arr) print arr[res] , res }
       ' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk 'BEGIN {FS="\t"} (NR <=10) {print $2}'


