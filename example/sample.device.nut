// MIT License
//
// Copyright 2017 Mystic Pants Pty Ltd
//
// SPDX-License-Identifier: MIT
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
// OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.

#include "../RC1692HP.class.nut"
#include "../utilities.nut"

local uart = hardware.uart12;
local sigFox = RC1692HP(uart);


//
//sigFox.switchMode(RC1692HP_MODE.CONFIG);
//sigFox.sendMessage("MysticPants");
//sigFox.configure(0x3a, 1);
/*
sigFox.readID(function(result){
    server.log("read id callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});
*/
/*
sigFox.readRSSI(function(result){
    server.log("read rssi callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
}); */
/*
sigFox.readTemperature(function(result){
    server.log("read temperature callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});*/
/*
sigFox.readBattery(function(result){
    server.log("read battery callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});
*/
sigFox.readConfigurationAt(0x3a, function(result) {
    server.log("read configuration callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});

//sigFox.switchMode(RC1692HP_MODE.CONFIG);
//sigFox.configure(0x3a, 1);
//sigFox.readConfigurationAt(0x3a);
//sigFox.switchMode(RC1692HP_MODE.NORMAL);



/*
sigFox.sendMessage("D'Rock");
sigFox.sendMessage("D'RockAgain");
*/

//sigFox.switchMode(RC1692HP_MODE.NORMAL);

/*
sigFox.sendMessage("Derrick");
sigFox.sendMessage("Rock");
*/



//sigFox.switchMode(RC1692HP_MODE.CONFIG);


//sigFox.sendMessage("MysticPants");
//sigFox.switchMode(RC1692HP_MODE.NORMAL);

/*
sigFox.switchMode(RC1692HP_MODE.CONFIG);


sigFox.readID(function(result){
    server.log("read id callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});
sigFox.readRSSI(function(result){
    server.log("read rssi callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});

sigFox.readTemperature(function(result){
    server.log("read temperature callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});

sigFox.readBattery(function(result){
    server.log("read battery callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});
sigFox.readConfigurationAt(0x3a, function(result) {
    server.log("read configuration callback");
    foreach(k,v in result) {
        server.log(format("key is %s , value is %s",k,v));
    }
});
*/
