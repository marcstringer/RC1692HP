# RC1692HP

This library can be used to communicate  between and Electric imp and a Sigfox RC1692HP via UART.

To add this library to your model, add the following lines to the top of your agent code:

```
#require "RC1692HP.lib.nut"
```
## Class Methods

### constructor(uart[, params])
Configures internal variables and configures UART settings

Parameter		| Type		| Description
--------------- | --------- | -----------
uart			| meta 		| a configured UART hardware pin
params			| table 	| See params

where `params` can include

Parameter      | Type    | Required | Default | Description
-------------- | ------- | -------- | ------- | -----------
baudRate	   | integer | No		| 19200	  | Rate at which information is transmitted
wordSize	   | integer | No		| 8		  | Word size in bits (7 or 8)
parity		   | integer | No		| 0		  | Parity bit: 0 means no parity bit, 1 includes an even parity bit and 2 includes an odd parity bit
stopBit		   | integer | No		| 1		  | Stop bits (1 or 2)
flags		   | integer | No		| 4		  | See : https://electricimp.com/docs/api/hardware/uart/configure/. Default is to disable flow control
timeout		   | float   | No		| 1.0	  | Time to wait for a response before timing out
delay		   | float   | No		| 2.0	  | Time to wait between performing actions in a queue
shouldLog	   | boolean | No		| false	  | Displays logs of transmitted and received data

#### Example
```
local uart = hardware.uart12;
local sigFox = RC1692HP(uart);
```



### congfigure(address, value)
configures parameters stored in non-volatile memory. See https://media.digikey.com/pdf/Data%20Sheets/Radiocrafts%20PDFs/RC16yyyy-SIG_UM_Rev1.9_6-10-16.pdf for a list of memory address and parameter values.

Parameter      	| Type   	 | Required | Default | Description
---------------	| ---------- | -------- | ------- | -----------
address			| Integer	 | Yes		| N/A	  | memory address of parameter you want to configure
value			| Integer	 | Yes		| N/A	  | new value for the the parameter that you want to configure


#### Example

```
const UART_BAUD_RATE = 0x30;
const BAUD_RATE_9600 = 0x03;

sigFox.configure(UART_BAUD_RATE, BAUD_RATE_9600);
```



### switchMode(mode)
Switches the RC1692HP Sigfox mode of operation.

Parameter      	| Type   	 | Required | Default | Description
---------------	| ---------- | -------- | ------- | -----------
mode			| integer	 | Yes		| N/A	  | The mode of operation you want Sigfox to operate in. Valid values include: RC1692HP_MODE.CONFIG and RC1692HP_MODE.NORMAL  

#### Example

```
sigFox.switchMode(RC1692HP_MODE.CONFIG);
```




### sendMessage
Sends a message to RC1692HP Sigfox

Parameter      	| Type   		 | Required | Default | Description
---------------	| -------------- | -------- | ------- | -----------
message			| String or Blob | Yes		| N/A	  | The message to be sent

#### Example

```
sigFox.sendMessage("MysticPants");
```



### readID ([callback])
Reads the device ID and the PAC number

Parameter      	| Type   		 | Required | Default | Description
---------------	| -------------- | -------- | ------- | ------------
callback		| function		 | No		| null	  | Callback executed when response from Sigfox is received. Callback receives 1 input parameter a table.

where Callback `params` includes

Parameter		| Type		| Description
--------------- | --------- | -----------
ID				| String	| device Id
PAC				| String	| device PAC number

#### Example

```
sigFox.readID(function(res) {

server.log("The ID is: " + res.ID);
server.log("The PAC number is: " + res.pAC );
});
```



### readRSSI ([callback])
Reads the signal Strength of a detected signal or valid packet

Parameter      	| Type   		 | Required | Default | Description
---------------	| -------------- | -------- | ------- | -----------
callback		| function		 | No		| null	  | Callback executed when response from Sigfox is received. Callback receives 1 input parameter a table.

where Callback `params` includes

Parameter		| Type		| Description
--------------- | --------- | -----------
RSSI			| Integer	| Signal Strength



#### Example

```
sigFox.readRSSI(function(res) {

server.log("The RSSI is: " + res.RSSI);
});
```



### readTemperature ([callback])
Reads the temperature of the RC1692HP Sigfox

Parameter      	| Type   		 | Required | Default | Description
---------------	| -------------- | -------- | ------- | -----------
callback		| function		 | No		| null	  | Callback executed when response from Sigfox is received. Callback receives 1 input parameter a table.

where Callback `params` includes

Parameter		| Type		| Description
--------------- | --------- | -----------
temperature		| Integer	| Temperature read from RC1692HP Sigfox


#### Example

```
sigFox.readTemperature(function(res) {

server.log("The temperature is: " + res.temperature);
});
```



### readBattery ([callback])

Reads the battery voltage of the RC1692HP Sigfox

Parameter      	| Type   		 | Required | Default | Description
---------------	| -------------- | -------- | ------- | -----------
callback		| function		 | No		| null	  | Callback executed when response from Sigfox is received. Callback receives 1 input parameter a table.

where Callback `params` includes

Parameter		| Type		| Description
--------------- | --------- | -----------
battery			| Float		| The battery voltage of the RC1692HP Sigfox

#### Example

```
sigFox.readBattery(function(res) {

server.log("The battery voltage is: " + res.battery);
});
```



### readConfigurationAt(address[, callback])
Reads the parameters values stored in non-volatile memory of the RC1692HP Sigfox

Parameter      	| Type   	 | Required | Default | Description
---------------	| ---------- | -------- | ------- | -----------
address			| Integer	 | Yes		| N/A	  | memory address of parameter you want to read from
callback		| Function	 | No		| null	  |  Callback executed when response from Sigfox is received. Callback receives 1 input parameter a table.

where Callback `params` includes

Parameter		| Type		| Description
--------------- | --------- | -----------
value			| Integer	| The value of the read parameter.

#### Example

```
const UART_BAUD_RATE = 0x30;
sigFox.readConfigurationAt(, function(res) {

server.log("The device's currently configured Baud Rate is: " + res.value);
});
```

# License

The RC1692HP library is licensed under the [MIT License](LICENSE).
