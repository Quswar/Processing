float x=width/2;
float xDelta=15;
float y=height/2;
float yDelta=15;


void setup()
{
  size(1080,720);
  background(100,200,150);
  frameRate(5000);
}
void draw()
{
  fill(random(0,255),random(0,255),random(0,255));
  stroke(random(0,255),random(0,255),random(0,255));
  ellipse(x,y,10,10);
  x=x+xDelta;
  y=y+yDelta;
  
  if (x>(width-15) || x<15)
  {
    xDelta=-xDelta;
  }
  if (y>(height-15) || y<15)
  {
    yDelta=-yDelta;
  }
}