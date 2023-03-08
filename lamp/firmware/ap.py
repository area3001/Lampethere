from config_server import ConfigServer
if False:
    "Dummy where we actually have a wifi connectin"
else:
    ConfigServer().run()
    


"""
import network
wlan = network.WLAN(network.AP_IF)

wlan.active(False)
host = 'lampethere'
wlan.config(dhcp_hostname = host, essid="lampethere")
wlan.active(True)

while not wlan.isconnected():
    pass


print("connected")


# Complete project details at https://RandomNerdTutorials.com
import socket

def web_page():
 
  html = "hello"
  return html

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 80))
s.listen(5)

while True:
  conn, addr = s.accept()
  print('Got a connection from %s' % str(addr))
  request = conn.recv(1024)
  request = str(request)
  print('Content = %s' % request)
  response = web_page()
  conn.send('HTTP/1.1 200 OK\n')
  conn.send('Content-Type: text/html\n')
  conn.send('Connection: close\n\n')
  conn.sendall(response)
  conn.close()

"""

"""
import machine, neopixel
np = neopixel.NeoPixel(machine.Pin(26), 4)
np[0]=(10,10,10)
np.write()
"""
