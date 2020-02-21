#!/bin/sh

in="$(echo $* | awk -F " " '{print $1}')"

random="$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c28)" || true

printf "$random" >> "$in"
