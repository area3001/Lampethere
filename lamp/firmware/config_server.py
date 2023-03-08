import network
import gc
import socket
gc.collect()

class ConfigServer():
    def __init__(self):
        self.ap = network.WLAN(network.AP_IF)
        self.sta = network.WLAN(network.STA_IF)
        
        self.ap.active(False)
        self.ap.config(essid="lampethere")
        self.ap.active(True)

        while not self.ap.isconnected():
            pass

        print("connected")
        
    def run(self):
        print("running server")
       
        
        
if __name__ == "__main__":
    server = ConfigServer()
    server.run()
    
    from microdot import Microdot

    app = Microdot()

     #/api/config [post|get]
     #/api/restart 

    @app.route('/')
    def index(request):
        print(request.args)
        icon = open("resources/index.html.gz")
        return icon.read(), 200, {'Content-type':'text/html','Content-Encoding': 'gzip'}
        #return '<html><head> <link rel="icon" type="image/x-icon" href="/favicon.svg"></head>Hello, world!</html>', 200, {'Content-Type': 'text/html'}
    
    @app.route('/api/wifi/networks')
    def scan(request):
        server.sta.active(True)
        networks = list([x[0].decode() for x in server.sta.scan()])
        server.sta.active(False)
        return networks
    
    @app.route('/favicon.svg')
    def scan(request):
        icon = open("resources/favicon.svg.gz")
        return icon.read(), 200, {'Content-type':'image/svg+xml','Content-Encoding': 'gzip'}

    app.run(port=80)
