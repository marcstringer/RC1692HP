
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
