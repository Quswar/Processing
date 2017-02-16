import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

void setup()
{
  size(500,500);
  background(100,200,150);
  arduino = new Arduino(this,"COM22",57600);
  arduino.pinMode(3,Arduino.INPUT);
  arduino.pinMode(4,Arduino.OUTPUT);
}

void draw()
{
  //do something!
}