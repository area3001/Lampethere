import json
from neopixel import NeoPixel
from machine import Pin

def load_json(filename):
    f = open(filename)
    json_obj = json.loads(f.read())
    f.close()
    return json_obj

class Display:
    RED = (255,0,0)
    GREEN = (0,255,0)
    BLUE = (0,0,255)
    YELLOW = (128+50,128-50,0)
    ORANGE = (128+90,128-90,0)
    MAGENTA = (128,0,128)
    PINK = (128+50,0,128-50)
    AZURE = (0,128,128)
    BLACK = (0,0,0)
    WHITE = (85+30,85-15,85-15)
        
    def __init__(self, pin, count):
        self._np = NeoPixel(Pin(pin), count)
        self.fill()
        
    def fill(self, color=(0,0,0)):
        self._np.fill(color)
        self._np.write()
        
        