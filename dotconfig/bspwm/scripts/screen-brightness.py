#!/usr/bin/env python3
import subprocess
import sys

arg = sys.argv[1]

# get the data on screens and current brightness, parsed from xrandr --verbose
current = [l.split() for l in subprocess.check_output(["xrandr", "--verbose"]).decode("utf-8").splitlines()]
# find the name(s) of the screen(s)
screens = [l[l.index("connected")-1] for l in current if "connected" in l]
# find the current brightness
currset = (round(float([l for l in current if "Brightness:" in l][0][1])*10))/10
# create a range of brightness settings (0.1 to 1.0)
sets = [n/10 for n in list(range(11))][1:]
# get the current brightness -step 
step = len([n for n in sets if currset >= n])

if arg == "up":
    if currset < 1.0:
        # calculte the first value higher than the current brightness (rounded on 0.1)
        nextbright = (step+1)/10
if arg == "down":
    if currset > 0.1:
        # calculte the first value lower than the current brightness (rounded on 0.1)
        nextbright = (step-1)/10
try:
    for scr in screens:
        # set the new brightness
        subprocess.Popen(["xrandr", "--output", scr, "--brightness", str(nextbright)])
except NameError:
    pass
