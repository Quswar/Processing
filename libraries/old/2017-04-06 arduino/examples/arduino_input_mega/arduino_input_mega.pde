
import processing.serial.*;

import cc.arduino.*;

Arduino arduino;


void setup() {
  size(880, 540);
  arduino = new Arduino(this,"COM4", 57600);
}

void draw() {
  background(off);
  stroke(on);
  
  // Draw a filled box for each digital pin that's HIGH (5 volts).
  for (int i = 0; i <= 53; i++) {
    if (arduino.digitalRead(i) == Arduino.HIGH)
      fill(on);
    else
      fill(off);

    if (i <= 13) {
      rect(420 - i * 30, 30, 20, 20);
    } else if (i <= 21) {
      rect(480 + (i - 14) * 30, 30, 20, 20);
    } else {
      rect(780 + (i % 2) * 30, 30 + (i - 22) / 2 * 30, 20, 20);
    }
  }
    
  // Draw a circle whose size corresponds to the value of an analog input.
  noFill();
  for (int i = 0; i <= 15; i++) {
    ellipse(280 + i * 30, 500, arduino.analogRead(i) / 16, arduino.analogRead(i) / 16);
    println(arduino.analogRead(A0));
  }
}