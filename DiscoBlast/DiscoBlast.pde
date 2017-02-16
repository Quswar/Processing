float x=width/2;
float xDelta=15;
float y=height/2;
float yDelta=15;


void setup()
{
  /*size(1080,720);*/fullScreen();
  background(100,200,150);
  frameRate(5000);
}
void draw()
{
  background(random(255),random(255),random(255));
  for (int i=0;i<5000;i++)
  {
    Draw();
  }
}


void Draw()
{
  x=random(width);
  xDelta=random(15);
  y=random(height);
  yDelta=random(15);
  
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