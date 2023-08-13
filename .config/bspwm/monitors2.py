#!/usr/bin/python3
import os

def run(command):
    with os.popen(command) as f:
        return f.read()

monitors = run(r"xrandr |awk '/connected/{print $1,$2}' | grep '\bconnected\b' | sed 's/ connected//g'").splitlines()

if len(monitors) == 1:
    run('xrandr --output eDP-1-1 --primary --mode 1920x1080 --rate 144')
elif len(monitors) == 2:
    xrandr = 'xrandr'
    xrandr += ' --output DP-0 --primary --mode 1920x1080 --rate 144'
    xrandr += ' --output eDP-1-1 --mode 1920x1080 --rate 144 --left-of DP-0'
    run(xrandr)
elif len(monitors) == 3:
    xrandr = 'xrandr'
    xrandr += ' --output DP-0 --primary --mode 2560x1440 --rate 165 --right-of eDP-1-1'
    xrandr += ' --output eDP-1-1 --mode 1920x1080 --rate 165'
    xrandr += ' --output HDMI-0 --mode 1920x1080 --rate 60 --right-of DP-0'
    run(xrandr)
