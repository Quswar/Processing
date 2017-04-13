import processing.serial.*; 

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
float inByte=0;
//float[] inByte_img =new float [16];
String inString;
//String[] inString_img= new String[16];
//PFont window1,window2;

void setup ()
{
  // set the window size:
  size(800, 600);
  //window1=createFont("Arial",12,true);
  //window2=createFont("Arial",12,true);

//  printArray(Serial.list());
  myPort = new Serial(this,"COM3", 9600);

  myPort.bufferUntil('\n');

  background(255);
}
float prev=0;
void draw ()
{
  int z=0;
  //textFont(window1,16);                  // STEP 3 Specify font to be used
  //fill(255);                         // STEP 4 Specify font color
  //text("Real FFT Plot",210,325);
 
  //textFont(window1,16);                  // STEP 3 Specify font to be used
  //fill(255);                         // STEP 4 Specify font color
  //text("Imaginary FFT Plot",180,645);
  if(xPos>=width)
  {
    clear();
    background(255);
    xPos=1;
  }
  convert();
 
  stroke(10);
  //println(inByte_real[z]);
  line(xPos-1, prev, xPos, height-inByte);
  prev=height-inByte;
   

 
  xPos++;
 
}
void convert()
{
  if (inString != null)
    {
     // trim off any whitespace:
     inString = trim(inString);
     // convert to an int and map to the screen height:
     inByte= int(inString);
     println(inByte);
     inByte = map(inByte, 0, 1023, 0, height);
    }
}


void serialEvent (Serial myPort) {
  // get the ASCII string:
  println("Serial Event");
  inString = myPort.readStringUntil('\n');
  println(inString);

 
}