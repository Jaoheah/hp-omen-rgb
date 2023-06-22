#!/bin/bash

[[ ! "$EUID" -eq 0 ]] && { echo 'hp-omen-rgb: ERROR! This command must be run as root or with sudo!'; exit 1; }

[[ -z $SUDO_USER ]] && { echo 'hp-omen-rgb: ERROR! The command must be run as root or with sudo!'; exit 1; }

FINAL_COLOR=

ORIG_COLOR="$(sudo -u "${SUDO_USER}" zenity --color-selection --title="Select color for RGB zone" --color="#FFF" | sed 's/[^0-9,]*//g'; [[ "${PIPESTATUS[0]}" != 0 ]] && echo fail)"

[[ "$ORIG_COLOR" -eq fail ]] && { echo 'hp-omen-rgb: The command has been cancelled.'; exit 2; }

for i in {1..3}; do
        FINAL_COLOR="${FINAL_COLOR}$(printf "%.2x" "$(echo "$ORIG_COLOR" | cut -f $i -d ',')" | awk '{print toupper($0)}')"
done

ZONE_ID="$(printf "${1}" | sed 's/[^0-9]*//g')"

[[ "${#ZONE_ID}" -ne 2 ]] && { echo 'hp-omen-rgb: ERROR! You must have the two digit Zone ID imputed after the command "hp-omen-rgb". There are four options. 00, 01, 02, and 03. For example to change the RGB value of Zone 1 you must type "hp-omen-rgb 01" '; exit 3; }

echo "$FINAL_COLOR" > "/sys/devices/platform/hp-wmi/rgb_zones/zone${ZONE_ID}"
