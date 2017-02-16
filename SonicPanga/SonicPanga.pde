/*
arduino_output

Demonstrates the control of digital pins of an Arduino board running the
StandardFirmata firmware.  Clicking the squares toggles the corresponding
digital pin of the Arduino.  

To use:
* Using the Arduino software, upload the StandardFirmata example (located
  in Examples > Firmata > StandardFirmata) to your Arduino board.
* Run this sketch and look at the list of serial ports printed in the
  message area below. Note the index of the port corresponding to your
  Arduino board (the numbering starts at 0).  (Unless your Arduino board
  happens to be at index 0 in the list, the sketch probably won't work.
  Stop it and proceed with the instructions.)
* Modify the "arduino = new Arduino(...)" line below, changing the number
  in Arduino.list()[0] to the number corresponding to the serial port of
  your Arduino board.  Alternatively, you can replace Arduino.list()[0]
  with the name of the serial port, in double quotes, e.g. "COM5" on Windows
  or "/dev/tty.usbmodem621" on Mac.
* Run this sketch and click the squares to toggle the corresponding pin
  HIGH (5 volts) and LOW (0 volts).  (The leftmost square corresponds to pin
  13, as if the Arduino board were held with the logo upright.)
  
For more information, see: http://playground.arduino.cc/Interfacing/Processing
*/

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

int TRIG=10;
int ECHO=9;

int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };

void setup() {
  size(470, 200);
  
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this,"COM16", 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
  
    arduino.pinMode(TRIG, Arduino.OUTPUT);
    arduino.pinMode(ECHO, Arduino.INPUT);
}

void draw() {
  
    arduino.digitalWrite(TRIG, Arduino.LOW);
    delayMicroseconds(2);
    arduino.digitalWrite(TRIG, Arduino.HIGH);
    delayMicroseconds(5);
    arduino.digitalWrite(TRIG, Arduino.LOW);
    int duration=pulseIn(ECHO);
    duration = duration/29/2;
    println(duration);
}



void delayMicroseconds(int micros){
  while(micros!=0)
  {
    micros--;
  }
}

int pulseIn(int pin)
{
  int start=millis();
  int duration = 0;
  
//  if (type=="HIGH")
  //{
    while (arduino.digitalRead(pin) != Arduino.HIGH)
    {
      duration = millis();
    }
  //}
  /*
  if (type=="LOW")
  {
    while (arduino.digitalRead(pin) != Arduino.LOW)
    {
      duration = millis();
    }
  }
  */
    duration = duration-start;
    return duration;
}