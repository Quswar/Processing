/*
//RecursiveCircles, I have to change the code to Java Syntax, & try to implement on Processing.
#include <iostream>
#include <graphics.h>
*/

void setup(){
  size(500,500);
  background(100,200,150);
}
void RecursiveCircles(float xCor, float yCor, float radius){
  if(radius<=1){
    //circle(xCor,yCor,1);
    ellipse(xCor*2,yCor*2,1,1);
  }
  else{
    //circle(xCor,yCor,radius);
    ellipse(xCor,yCor,radius*2,radius*2);
    RecursiveCircles(xCor+(radius*1.5),yCor,radius/2);
  }
}

void draw(){
  RecursiveCircles(100,50,50);
}