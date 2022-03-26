#!/usr/bin/env python3
import os

def run(command):
    with os.popen(command) as f:
        return f.read()

def workspace(monitors):
    amount = len(monitors)
    if amount == 1: amount = 2
    print(amount)
    workspaces= " ".join(str(e) for e in list(range(1, 10//amount+1)))
    return workspaces
monitors = run(r"xrandr |awk '/ connected/{print $1}'").splitlines()
workspaces = workspace(monitors)

for monitor in monitors:
    #run(f'echo bspc monitor {monitor} -d {workspaces} >> ~/.config/bspwm/lol.txt')
    run(f'bspc monitor {monitor} -d {workspaces}')
