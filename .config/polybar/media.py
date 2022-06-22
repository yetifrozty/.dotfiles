#!/usr/bin/python3
import sys
import time
import os



def truncate(string, width):
    if len(string) > width:
        string = string[:width-3] + '...'
    return string

def run(command):
    with os.popen(command) as cmd:
        return cmd.read()

command = "playerctl metadata -f '%{A1:playerctld unshift:}%{A} {{playerName}} %{A1:playerctld shift:}%{A} %{A1:playerctl previous:}玲%{A} %{A1:playerctl play-pause:}{{status}}%{A} %{A1:playerctl next:}怜%{A} {{artist}} - {{title}} '"
line = run(command)
line = line.rstrip("\n").replace("Playing", "").replace("Paused", "契")
songinfo = line[line.rfind("怜") + 6:].replace("\"", "")

line = line[:line.rfind("怜") + 6] + truncate(songinfo, 25)
print(line)
