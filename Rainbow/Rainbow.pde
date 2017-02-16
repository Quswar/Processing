/**
* rainbow spin
*
* @author aa_debdeb
* @date 2016/07/07 
*/

float R = 220;
float angleStep = 24;

void setup(){
  size(500, 500);
  stroke(0);
  strokeWeight(3);
}

void draw(){
  colorMode(RGB, 255);
  background(255);
  colorMode(HSB, 360, 100, 100);
  translate(width / 2, height / 2);
  rotate(frameCount * 0.03);
  float rot = map(mouseX, 0, width, -3.0, 3.0);
  for(float angle = 0; angle < 360; angle += angleStep){
    fill(angle, 100, 100);
    beginShape();
    for(float r = 0; r < R; r += 1){
      float x = r * cos(radians(angle + r * rot));
      float y = r * sin(radians(angle + r * rot));
      vertex(x, y);
    }
    for(float a = angle; a < angle + angleStep; a += 1){
      float x = R * cos(radians(a + R * rot));
      float y = R * sin(radians(a + R * rot));
      vertex(x, y);      
    }
    for(float r = R; r > 0; r -= 1){
      float x = r * cos(radians(angle + angleStep + r * rot));
      float y = r * sin(radians(angle + angleStep + r * rot));
      vertex(x, y);
    }
    endShape();
  }
  fill(0, 0, 100);
  ellipse(0, 0, 2 * R * 0.2, 2 * R * 0.2);
}