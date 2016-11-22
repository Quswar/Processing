/*
Circle Chase with Potentiometer [variable voltage source]
by Quswar Mahmood Abid
for Makeistan Arduino Night
September 23, 2016
The Code is in Public Domain.
*/


import processing.opengl.*;
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;



float x;
float y;

float easing = 0.05;
float diameter = 12;

float destinationX;
float destinationY;

float randomX;
float randomY;

int count=0;

void setup() 
{
  size(500,500);
  smooth();
  frameRate(30);
  //////////////////////////////////
  arduino = new Arduino(this, "COM22", 57600);          //Put your Connected Serial Port here! e.g. "COM14", "COM18", "COM15" etc
  //////////////////////////////////
  background(100,200,150);
  randomX = (random(50,450)*50)%450;
  randomY = (random(50,450)*50)%450;
  fill(255,255,0);
  ellipse(randomX,randomY,50,50);
  //////////////////////////////////
}
void draw()
{
  background(100,200,150);
  fill(255,255,0);
  ellipse(randomX,randomY,50,50);
  
  float targetX = map(arduino.analogRead(0), 0, 1023, 0, width);        //arduino.analogRead(0);
  float targetY =map(arduino.analogRead(1), 0, 1023, 0, height);        //arduino.analogRead(1);
  println(targetX, ", ", targetY);

  x = x + (targetX - x) * easing;
  y = y + (targetY - y) * easing;
  
  fill(255);
  ellipse(x, y, 15, 15);
  
  if(x>(randomX-50) && x<(randomX+50) && y>(randomY-50) && y<(randomY+50))
  {
    randomX = (random(50,450)*50)%450;
    randomY = (random(50,450)*50)%450;
    count++;
    println(count);
  }
}