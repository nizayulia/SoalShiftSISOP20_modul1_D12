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

random="$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c28)" || true
enkripsi="$(echo "$in" | tr [A-Z] ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] | tr [a-z] ["$posisiawalkecil"-za-"$posisiakhirkecil"])"
dekripsi="$(echo "$in" | tr ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] [A-Z] | tr ["$posisiawalkecil"-za-"$posisiakhirkecil" [a-z]])"

printf $random $'\n' >> "$enkripsi".txt

#mv $1 "$dekripsi".txt

else echo "error"
fi