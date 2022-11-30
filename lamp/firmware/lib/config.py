import ujson

def load_config(file_name):
    with open(file_name) as config_file:
        return Config(ujson.loads(config_file.read()))

class Config:
    def __init__(self, json_object):
        self.raw = json_object
        self.wifi = json_object["wifi"]
        self.mqtt = json_object["mqtt"]