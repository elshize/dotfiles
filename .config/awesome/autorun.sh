#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run setxkbmap pl -option caps:escape
run insync start
run xrandr --output DP1 --dpi 100
#run twmnd
run nm-applet
run blueman-applet
