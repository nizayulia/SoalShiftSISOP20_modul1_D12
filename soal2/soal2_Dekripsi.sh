#!/bin/sh

in="$(echo $* | awk -F "." '{print $1}')"

waktu="$( date +"%H" )"

besar=({A..Z})
kecil=({a..z})
posisiawalbesar=${besar[$waktu]}
posisiawalkecil=${kecil[$waktu]}
posisiakhirbesar=${besar[$waktu-1]}
posisiakhirkecil=${kecil[$waktu-1]}

dekripsi="$(echo "$in" | tr ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] [A-Z] | tr ["$posisiawalkecil"-za-"$posisiakhirkecil" [a-z]])"

mv $1 "$dekripsi".txt
