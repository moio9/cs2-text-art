#!/bin/bash


cs="$HOME/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg" #edit this if needed
folder_name="art"
full_path="$cs/$folder_name"

text="$*"
banner="figlet -k"

while getopts ":b:" opt; do
  case ${opt} in
    b )
      banner=${OPTARG}
      ;;
    \? ) echo "Usage: draw [-b optional] 'text'"
      ;;
  esac
done

final_text=$(eval "$banner <<< "$text"")

if [ $# -eq 0 ]; then
echo Paste your draw: 
   while IFS= read -r line && [ -n "$line" ]; do
        final_text+="$line"$'\n'
    done
fi



text_no_spaces="${final_text// /$(echo -ne '.')}"

IFS=$'\n' read -rd '' -a lines <<< "$text_no_spaces"


mkdir -p "$full_path"


for i in "${!lines[@]}"; do
  echo "say ${lines[$i]}
  bind p exec $folder_name/output_$((i+2))
  bind o exec $folder_name/output_1
  " > "$full_path/output_$((i+1)).cfg"
done

echo "
######################################
#\"$full_path\" successfully created!#
######################################
┌────────────────────────────────────┐
│    Please help keep this project   │
│             alive:                 │
│                                    │
├────────────────────────────────────┤
│    Monero:   46Mk8t9uLY7jnBXnyHM   │
│              yVARvwk1Y7jcGEQwKLN8  │
│              GtGGBioncjKLgkEa33jE  │
│              N2ibgkQjoFZWVwXXwsM3  │
│              vzAFz4RzV7psLow6      │
│                                    │
├────────────────────────────────────┤
│    Bitcoin:  bc1qgxp74eza7jaf4fdw  │
│              5cl3sanqvnh0cjmz0w9scz│
│                                    │
├────────────────────────────────────┤
│    Ethereum: 0xa024a505Ec24c7eA16  │
│               3985eC89D56e614B9AdAa│
│               e                    │
│                                    │
├────────────────────────────────────┤
│    PayPal:   paypal.me/moioyoyo    │
└────────────────────────────────────┘
  moioyoyo76@gmail.com
"
