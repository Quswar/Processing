import processing.serial.*;
import cc.serial.*;

Arduino arduino;

void draw()
{
  arduino = new Arduino(this,"COM22",57600);
  arduino.pinMode(3,Arduino.INPUT);
  arduino.pinMode(4,Arduino.OUTPUT);
}