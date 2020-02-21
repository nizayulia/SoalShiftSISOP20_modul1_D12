#!/bin/sh

in="$(echo $* | awk -F "." '{print $1}')"
if [[ $in =~ ^[a-zA-Z]+$ ]]
then

waktu="$( date +"%H" )"

besar=({A..Z})
kecil=({a..z})
posisiawalbesar=${besar[$waktu]}
posisiawalkecil=${kecil[$waktu]}
posisiakhirbesar=${besar[$waktu-1]}
posisiakhirkecil=${kecil[$waktu-1]}

enkripsi="$(echo "$in" | tr [A-Z] ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] | tr [a-z] ["$posisiawalkecil"-za-"$posisiakhirkecil"])"

printf " " >> "$enkripsi".txt

else echo "error"
fi
