#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
# xsetroot -xcf /usr/share/icons/phinger-cursors/cursors/left_ptr 32
run nm-applet
#run caffeine
run xfce4-power-manager
run blueberry-tray
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on
run mailspring -b
run nitrogen --restore
run volumeicon -d pulse
run mpd
run mpDris2
# run conky -c $HOME/.config/awesome/system-overview
