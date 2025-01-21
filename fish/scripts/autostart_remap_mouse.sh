#!/bin/sh

if traceroute -m 1 1.1.1.1 | tail -n 1 | grep -q 'stargate\.ccri\.com';
then
  # onsite
  mouse_id="$(xinput list --id-only 'Kensington Slimblade Trackball')"
  xinput set-button-map "$mouse_id" "3 2 1 4 5 6 7 8 9"
  echo xinput set-button-map "$mouse_id" "3 2 1 4 5 6 7 8 9"
fi
