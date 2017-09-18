#!/bin/bash
cupsPATH="/Library/Printers/PPDs/Contents/Resources" # could set to any absolute path
declare -a installedppds=(${cupsPATH}/Xerox\ WorkCentre*)

# Xerox Driver Fix
for i in "${installedppds[@]}"
do
   :   
   gzip -df "$i" > "${i%.*}"
   sed -i '' '/*cupsCommands:/s/"\([^"]*\)/"/' "${i%.*}"
   gzip -f "${i%.*}" > "$i"
done