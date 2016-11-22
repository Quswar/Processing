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
  
  float targetX = mouseX;
  float targetY = mouseY;
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