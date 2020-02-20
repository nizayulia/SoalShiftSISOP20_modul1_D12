  #! bin/bash

	awk -F "	" '
	{ if( $13 != "Region" ) arr[$13]+=$21;}
	END {for (res in arr) printf res "\n" }
	' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | head -1
