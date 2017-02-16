color later;
color former;

color colorX;

void setup()
{
  /*size(1080,720);*/fullScreen();
  later = color(random(255),random(255),random(255));
  former = color(0,0,0);
}
void draw()
{
  colorX=(former-later)/10;
  later+=colorX;
  background(later);
  delay(1000);
  //println(later, ",",former, ",", colorX);
  if ((former-later)<=colorX)
  {
    later=color(random(255),random(255),random(255));
  }
}