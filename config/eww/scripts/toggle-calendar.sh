#!/usr/bin/bash
is_open=$1

if [ $is_open = false ]; then
  eww open calendar_window
  eww update toggle_calendar=true
else 
  eww close calendar_window
  eww update toggle_calendar=false
fi

