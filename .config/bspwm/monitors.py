#!/usr/bin/python3
# Edit here what monitors are 1 2 3...
#if you dont know where your monitors are connected do this command:

#xrandr --query | grep '\bconnected\b'

#example:

#priority = ["DP-0", "DP-1"]
priority = []

import os, sys



def run(command):
    

    with os.popen(command) as f:
        return f.read()
def get_res(monitor):
    command = run('xrandr')
    index = command.find(monitor)
    index = command.find('\n', index + 1)
    stuff = command[index:command.find('\n', index + 5)].split()
    
    res = stuff[0]
    stuff.pop(0)

    numbers = []

    for i in stuff:
        i = i.replace('*', '')
        i = i.replace('+', '')
        
        if i:
            numbers.append(float(i))

    hz = max(numbers)

    return res, hz


def workspace(a, b):
    monitors = [['I II III IV V VI VII VIII IX X'], ['I II III IV V', 'VI VII VIII IX X'], ['I II III', 'IV V VI', 'VII VIII IX X']]
    return monitors[a-1][b]

monitors = run(r"xrandr |awk '/connected/{print $1,$2}' | grep '\bconnected\b' | sed 's/ connected//g'").splitlines()

for monitor in priority:
    try:
        index = monitors.index(monitor)
        monitors.pop(index)
    except:
        priority.pop(0)

priority.extend(monitors)

amount = len(priority)





xrandr_command = 'xrandr'





#primary monitor

res, hz = get_res(priority[0])
xrandr_command += f' --output {priority[0]} --primary --mode {res} --rate {hz}'


for i in priority[1:]:
    res, hz = get_res(i)
    xrandr_command += f' --output {i} --mode {res} --rate {hz} --left-of DP-0'



for i in range(amount):
    run(f'bspc monitor {priority[i]} -d {workspace(amount, i)}')
    print(f'bspc monitor {priority[i]} -d {workspace(amount, i)}')

run(xrandr_command)
print(priority)
