//Changed the Firmata example code into newone, simulating single pin ping sensor sketch.

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