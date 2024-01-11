import network
from time import sleep
import machine
from common import load_json, Display

CONFIG_FILE = "config.json"
LED_PIN = 4
LED_COUNT = 1

disp = Display(LED_PIN, LED_COUNT)

try:
    config = load_json(CONFIG_FILE)
except OSError:
    print(f"Missing config file {CONFIG_FILE}")
    while True:
        disp.fill(Display.RED)
        sleep(.5)
        disp.fill(Display.BLUE)
        sleep(.5)
except:
    print("Unknown error, halting")
    while True:
        disp.fill(Display.RED)
        sleep(.5)
        disp.fill()
        sleep(.5)


wifi = network.WLAN(network.STA_IF)
wifi.active(True)
for cred in config["networks"]:
    print(f"connecting to {cred['ssid']}")
    wifi.connect(cred["ssid"],cred["pass"])
    try_count = 20
    while not wifi.isconnected() and try_count > 0:
        sleep(.25)
        disp.fill(Display.BLUE)
        sleep(.25)
        disp.fill()
        try_count -= 1
        if wifi.isconnected():
            break
if not wifi.isconnected():
    disp.fill(Display.RED)
    sleep(5)
    machine.reset()
disp.fill(disp.GREEN)
print('Connected')

import mip
mip.install("github:area3001/Lampethere/lamp-mini/firmware", version="mini") 
try:
    from lampethere.app import Lampethere
    disp.fill()
    #disp.fade(disp.BLACK, 1)
    Lampethere.run()
except:    
    # append error to log
    while True:
        disp.fill(Display.RED)
        sleep(.5)
        disp.fill(Display.PINK)
        sleep(.5)