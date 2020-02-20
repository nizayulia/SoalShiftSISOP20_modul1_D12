#! bin/bash

	awk -F "	" '
	{ if ($13 == "Central" && $11!=State) arr[$11]+=$21;}
	END {for (res in arr)
		print arr[res],res
	     }
       ' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk '(NR <=2) {print $2}'
