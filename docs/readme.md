# Lampethere mqtt & data configuration

## MQTT topics

| Topic | Last Will | QOS | Persistent | Remarks | 
|----|----|----|----|----|
|lampethere/device/**\<device id>**||1|TRUE|set by the lamp after connecting to MQTT|
|lampethere/device/\<device id>/**status**|"offline"|1|TRUE|set by the lamp to "online" after connecting to MQTT|
|lampethere/device/\<device id>/**display**||0|TRUE|BLOB containing the pixel information to display<br />Set by the controller|
|lampethere/device/\<device id>/**animation**||1|TRUE|How to show the data in display|
|lampethere/device/\<device id>/**event**||1|FALSE|Set by the lamp when an event happens|


### Details
* device id: this is a unique ID based on the ESP hardware. It can be the MAC address, serial number or flash_id
* status: "online" or "offline"
* display: byte array with len = LED's * 3.
* animation:
  * static: as is, not animated
  * rotate: rotate around the z axis (4 hz)
  * scroll-up: move rows up at 4 hz, overflowed rows are re-addd on the bottom
  * scroll-down: like scroll-up but in the other direction
  * blink: blink leds on and off at 2 hz
  * breathing: like blinking but with added fading effect
  * fade-out: slowly face led's off (2 seconds), no repeat
* event: 
  * button pressed: {"id":1..4, "duration_ms":n}   
    When a user presses and releases a button, the lamp will transmit the button ID together with the duration to the controller. After pressing the button for 2 seconds the message is also sent without waiting for a release.


## Controller state
The controller has to maintain it's own state. This section describes the variables required.   
These variables will also be peristed to disk when they change and reloaded when starting up the controller.

* devices[\<device id>]: a dictionary of devices by device id.    
  ```json
  {
    "name":"device friendly name",
    "colors": ["#RGB", "#RGB"] //2 colors uniquely identifying the device
  }
  ```
* groups[\<group name>]: a dictionary of lamp groups.   
  ```json
  {
    "members": ["device id_1","device id_2",..], //a device can be in more than one group
    "state": {
      "first_event": timestamp,
      "event_members": ["who has pressed"]
    }
  }
  ```   
* settings:
    ```json
    {
        "timeout": 123, //time for an event to exist before resetting
        "MQTT_Connection": ""
    }
    ```


## Subscriptions

### Lamp
* lampethere/device/\<device id>/**display**   
* lampethere/device/\<device id>/**animation**

### controller
* lampethere/device/+/**status**
* lampethere/device/+/**event**
