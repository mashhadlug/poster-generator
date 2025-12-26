#!/usr/bin/env bash

loc="$1"
[ -z "$loc" ] && { read -rp "Enter location: " loc; }

neshan_to_osm() {
  local url="$1" lat lon
  lat="$(echo "$url" | sed -n 's/.*#c\([0-9.]\+\)-\([0-9.]\+\)-.*/\1/p')"
  lon="$(echo "$url" | sed -n 's/.*#c\([0-9.]\+\)-\([0-9.]\+\)-.*/\2/p')"
  echo "https://www.openstreetmap.org/?mlat=$lat&mlon=$lon#map=17/$lat/$lon"
}

google_to_osm() {
  local url="$1" lat lon
  lat="$(echo "$url" | sed -n 's#.*/@\([0-9.]\+\),\([0-9.]\+\),.*#\1#p')"
  lon="$(echo "$url" | sed -n 's#.*/@\([0-9.]\+\),\([0-9.]\+\),.*#\2#p')"
  echo "https://www.openstreetmap.org/?mlat=$lat&mlon=$lon#map=17/$lat/$lon"
}

if echo "$loc" | grep -q neshan.org; then
  neshan_to_osm "$loc"
elif echo "$loc" | grep -q google.com/maps; then
  google_to_osm "$loc"
elif echo "$loc" | grep -q openstreetmap.org; then
  echo "$loc"
elif echo "$loc" | grep -q osm.org; then
  echo "$loc"
else
    echo "unknown location link format"
fi
