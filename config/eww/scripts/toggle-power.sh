#!/usr/bin/bash
is_open=$1

if [ $is_open = false ]; then
  eww open power_window
  eww update toggle_power=true
else
  eww close power_window
  eww update toggle_power=false
fi
