#!/usr/bin/env bash

#terminate media module if already running
#killall media

#run the media module
~/.config/polybar/medialaunch &


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    ETH=$(ls /sys/class/net | grep -v lo | grep e) WLAN=$(ls /sys/class/net | grep -v lo | grep wl) MONITOR=$m polybar -r mybar &
  done
else
  polybar --reload example &
fi

echo "Bars launched..."
