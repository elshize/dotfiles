import argparse
import subprocess
import os.path
from time import sleep
from datetime import time, datetime

parser = argparse.ArgumentParser(description='Switch bitday wallpapers', prog='bdswitch')
parser.add_argument('dir', help='The directory with wallpapers.')

args = parser.parse_args()

#wallpapers = [
#    ("10-Early-Night.png", time (0)),
#    ("11-Mid-Night.png", time(2)),
#    ("12-Late-Night.png", time(4)),
#    ("01-Early-Morning.png", time(6)),
#    ("02-Mid-Morning.png", time(8)),
#    ("03-Late-Morning.png", time(10)),
#    ("04-Early-Afternoon.png", time(12)),
#    ("05-Mid-Afternoon.png", time(14)),
#    ("06-Late-Afternoon.png", time(16)),
#    ("07-Early-Evening.png", time(18)),
#    ("08-Mid-Evening.png", time(20)),
#    ("09-Late-Evening.png", time (22))
#]

wallpapers = [
    ("01.png", time(0)),
    ("02.png", time(3)),
    ("03.png", time(6)),
    ("04.png", time(9)),
    ("05.png", time(12)),
    ("06.png", time(15)),
    ("07.png", time(18)),
    ("08.png", time(21))
]

while True:
    now = datetime.now().time()
    chosen = -1
    for wp, tm in reversed(wallpapers):
        if now > tm:
            chosen = wp
            break
    print("selecting wallpaper {}".format(chosen))
    subprocess.run(["feh", "--bg-scale", os.path.join(args.dir, chosen)])
    sleep(15 * 60) # sleep for 15 minutes
