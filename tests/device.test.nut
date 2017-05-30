



class DeviceTestCase extends ImpTestCase {

    _uart = null;
    _sigFox = null;

    // Instatiates the sigFox class and configures UART
    function setUp() {
        _uart = hardware.uart12;
        _sigFox = RC1692HP(_uart);

        return true;

    }



    // tests the reading temperature function. Checks for a single result that is a string
    function testReadTemperature() {

        return Promise(function(resolve, reject) {

            _sigFox.readTemperature(function(result){

                foreach(k,v in result) {
                    try {
                        this.assertTrue(result.len() == 1, "The actual legnth " + result.len());
                        this.assertTrue(typeof(v) == "string", "The actual type of " + v + " is " + typeof(v));
                        resolve();
                    } catch(e) {
                        reject(e);
                    }

                }
            }.bindenv(this));
        }.bindenv(this))
    }



    // tests the readingSSI function. Checks for a single result that is a string
    function testReadSignalStrength() {

        return Promise(function(resolve, reject) {

            _sigFox.readRSSI(function(result){

                foreach(k,v in result) {
                    try {
                        this.assertTrue(result.len() == 1, "The actual legnth " + result.len());
                        this.assertTrue(typeof(v) == "string", "The actual type of " + v + " is " + typeof(v));
                        resolve();
                    } catch(e) {
                        reject(e);
                    }

                }
            }.bindenv(this));
        }.bindenv(this))
    }



    // tests the reading signal strength function. Checking for both PAC and ID
    // received and the correct length
    function testReadID() {

        return Promise(function(resolve, reject) {

            _sigFox.readID(function(result){

                foreach(k,v in result) {
                    try {
                        if (k == "PAC") {
                            this.assertTrue(result.len() == 2, "The actual legnth " + result.len());
                            this.assertTrue(typeof(v) == "string", "The actual type of " + v + " is " + typeof(v));
                            this.assertTrue(v.len() == 24, "The actual legnth " + v.len());
                        }
                        else {
                            this.assertTrue(typeof(v) == "string", "The actual type of " + v + " is " + typeof(v));
                            this.assertTrue(v.len() == 12, "The actual legnth " + v.len())
                        }
                    } catch(e) {
                        reject(e);
                    }

                }
                resolve();
            }.bindenv(this));

        }.bindenv(this))
    }



    // tests the configuration looking a single response and that a string is returned
    // specifically getting the value for led indication which is default set as 1
    function testReadConfigurationAt() {

        return Promise(function(resolve, reject) {
            _sigFox.readConfigurationAt(0x3a, function(result) {
                foreach(k,v in result) {
                    try {
                        this.assertTrue(result.len() == 1, "The actual length " + result.len());
                        this.assertTrue(typeof(v) == "string", "The actual type of " + v + " is " + typeof(v));
                        this.assertTrue(v == "1", "The actual value of " + v + " is " + v);
                        resolve();
                    } catch(e) {
                        reject(e);
                    }
                }
            }.bindenv(this));
        }.bindenv(this));
    }



    // tests the readBattery function returns a single value
    // when plugged in with a usb should be returning 3.36
    function testReadBattery() {

        return Promise(function(resolve, reject) {
            _sigFox.readBattery(function(result){
                server.log("read battery callback");
                foreach(k,v in result) {
                    try {
                        this.assertTrue(result.len() == 1, "The actual legnth " + result.len());
                        this.assertTrue(typeof(v) == "string", "The actual type of " + v + " is " + typeof(v));
                        this.assertTrue(v == "3.36", "The actual value of " + v + " is " + v);
                        resolve();
                    } catch(e) {
                        reject(e);
                    }
                }
            }.bindenv(this));
        }.bindenv(this));
    }
}
