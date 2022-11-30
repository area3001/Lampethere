#todo
# connect to wifi (skip AP mode option for now)
# if connected check if there are updated files
# update and restart
import machine
import time
from lib.net import connect as net_connect, Ota
from lib.config import load_config

#thony break button

config = load_config("config.json")
try:
    net_connect(config.wifi)
    Ota.update()
except:
    print("resetting in 5 seconds")
    # blink LEDS with error code
    time.sleep(5)
    machine.reset()

from app import Lampethere

Lampethere(config).run()