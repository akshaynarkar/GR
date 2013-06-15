  ///////////////////////////////////////////////////////////////
  // This is the code constructed for the scispace             //          
  // event for IEEE at SAKEC.                                  //
  //It is for the GUI control exercise                         //  
  //for using laptop to control robot                          // 
  //it is customized  from larry's code                        // 
  //Please feel free to use the code but mention the following //
  //(c) luckylarry.co.uk  (c) scispace.tk                      //
  /////////////////////////////////////////////////////////////// 
 
// load the serial library for Processing
import processing.serial.*; 
// instance of the serial class
Serial port;
// values to store X, Y for each button
int M1LX, M1RX, M2LX, M2RX, M3LX, M3RX, M4LX, M4RX, M5LX, M5RX;
int M1LY, M1RY, M2LY, M2RY, M3LY, M3RY, M4LY, M4RY, M5LY, M5RY;
// stores the width/height of the box
int boxSize = 64;
// 2 new instances of my arrow class
// also set an array of coordinates for each arrow
arrow myRightArrow;
int[]rightArrowxpoints={30,54,30,30,0,0,30}; 
int[]rightArrowypoints={0,27,54,40,40,15,15};
arrow myLeftArrow;
int[]leftArrowxpoints={0,24,24,54,54,24,24}; 
int[]leftArrowypoints={27,0,15,15,40,40,54};
// set the font
PFont myFont;
 
void setup()  {
  // screen size of the program
  size(145, 455);
 // set the coordinates of each button box
  // base motor M1LX = Motor 1 Left X  etc..
  M1LX = 5;
  M1LY = 25;
  M1RX = 75;
  M1RY = 25;  
  // shoulder motor
  M2LX = 5;
  M2LY = 115;
  M2RX = 75;
  M2RY = 115;
  // elbow motor
  M3LX = 5;
  M3LY = 205;
  M3RX = 75;
  M3RY = 205;
  // wrist motor
  M4LX = 5;
  M4LY = 295;
  M4RX = 75;
  M4RY = 295;
  // hand motor
  M5LX = 5;
  M5LY = 385;
  M5RX = 75;
  M5RY = 385;
 
  // List all the available serial ports in the output pane. 
  // You will need to choose the port that the Arduino board is 
  // connected to from this list. The first port in the list is 
  // port #0 and the third port in the list is port #2. 
  println(Serial.list()); 
  // set the font to use
  myFont = createFont("verdana", 12);
  textFont(myFont);
  // Open the port that the Arduino board is connected to (in this case #0) 
  // Make sure to open the port at the same speed Arduino is using (9600bps)
  port = new Serial(this, "COM5", 57600); 
  // create the base arrow
  myRightArrow = new arrow(rightArrowxpoints,rightArrowypoints,7);
  myLeftArrow = new arrow(leftArrowxpoints,leftArrowypoints,7);
}
 
void draw() 
{ 
  background(0);
  noStroke();
  fill(150);
  // draw each box/ button with a label above each    
  text("F Left/Right (Q/E)", 5, 5, 200, 75); 
  text("B Left/Right (A/D)", 5, 95, 200, 75);
  text("Forward/Backward(W/S)", 5, 185, 200, 75);
  text("Not in use ", 5, 275, 200, 75);     
  text("Not in use ", 5, 365, 200, 75);
 
  // start looking to see whats pressed and send a value
  // over the serial port
  if(keyPressed) {                                 //The keyPressed() function is called once every time a key is pressed. The key that was pressed is stored in the key variable. 
    if (key == 'q' || key == 'Q' ) {                //	The system variable key always contains the value of the most recent key on the keyboard that was used (either pressed or released). 
      port.write('d');
    }
    if (key == 'w' || key == 'W' || keyCode == UP) {
      port.write('h');
    }
    if (key == 'e' || key == 'E') {
      port.write('c');
    }
    if (key == 'd' || key == 'D') {
      port.write('a');
    }
    if (key == 'a' || key == 'A') {
      port.write('b');
    }
    if (key == 's' || key == 'S'|| keyCode == DOWN) {
      port.write('g');
    }
    if (key == 'd' || key == 'D') {
      port.write('D');
    }
    if (key == 'f' || key == 'F') {
      port.write('F');
    }
    if (key == 'z' || key == 'Z') {
      port.write('Z');
    }
    if (key == 'x' || key == 'X') {
      port.write('X');
    }
  } 
  // if no key is pressed check to see if the mouse button is pressed
  else if (mousePressed == true) {
    // check to see if the mouse is inside each box/ button if so send the value
    if (mouseX > M1LX-boxSize && mouseX < M1LX+boxSize && 
      mouseY > M1LY-boxSize && mouseY < M1LY+boxSize) {
        port.write('d'); 
         
    } 
    else if(mouseX > M1RX-boxSize && mouseX < M1RX+boxSize && 
      mouseY > M1RY-boxSize && mouseY < M1RY+boxSize) {
        port.write('c'); 
    } 
    else if(mouseX > M2LX-boxSize && mouseX < M2LX+boxSize && 
      mouseY > M2LY-boxSize && mouseY < M2LY+boxSize) {
        port.write('b'); 
    } 
    else if(mouseX > M2RX-boxSize && mouseX < M2RX+boxSize && 
      mouseY > M2RY-boxSize && mouseY < M2RY+boxSize) {
        port.write('a'); 
    } 
    else if(mouseX > M3LX-boxSize && mouseX < M3LX+boxSize && 
      mouseY > M3LY-boxSize && mouseY < M3LY+boxSize) {
        port.write('h');   
    } 
    else if(mouseX > M3RX-boxSize && mouseX < M3RX+boxSize && 
      mouseY > M3RY-boxSize && mouseY < M3RY+boxSize) {
        fill(200);
        port.write('g');     
    }
    else if (mouseX > M4LX-boxSize && mouseX < M4LX+boxSize && 
      mouseY > M4LY-boxSize && mouseY < M4LY+boxSize) {
        port.write('D');     
    } 
    else if(mouseX > M4RX-boxSize && mouseX < M4RX+boxSize && 
      mouseY > M4RY-boxSize && mouseY < M4RY+boxSize) {
        port.write('F');  
    } 
    else if (mouseX > M5LX-boxSize && mouseX < M5LX+boxSize && 
      mouseY > M5LY-boxSize && mouseY < M5LY+boxSize) {
        port.write('Z'); 
    }
    else if(mouseX > M5RX-boxSize && mouseX < M5RX+boxSize && 
      mouseY > M5RY-boxSize && mouseY < M5RY+boxSize) {
        port.write('X');    
    }
    else {
      // if the mouse is pressed but not with in a box make sure nothings moving
      port.write('0');   
    } 
  } else {
    // no key or mouse press then make sure nothings moving.
    port.write('f');   
  } 
 
  // draw the buttons
  myRightArrow.drawArrow(80,30);
  myRightArrow.drawArrow(80,120);
  myRightArrow.drawArrow(80,210);
  myRightArrow.drawArrow(80,300);
  myRightArrow.drawArrow(80,390);
  myLeftArrow.drawArrow(10,30);
  myLeftArrow.drawArrow(10,120);
  myLeftArrow.drawArrow(10,210);
  myLeftArrow.drawArrow(10,300);
  myLeftArrow.drawArrow(10,390);
}
 
class arrow extends java.awt.Polygon { 
  /* our class is basically an instance of java.awt.Polygons and this class expects and array of X points, Y points and the number of 
     points in our shape. The variable names also have to be direct references to what this class expects, so xpoints, ypoints and npoints are all
     set/defined in the java class.
  */
  public arrow(int[] xpoints,int[] ypoints, int npoints) {
    // super invokes the java.awt.Polygon class
    super(xpoints,ypoints,npoints);
 
  } 
    // supply offsets to draw the arrow, means I don't need to set points for each one
    void drawArrow(int xOffset, int yOffset){
    fill(150);
    rect(xOffset-5, yOffset-5, boxSize, boxSize);
    fill(255);
    beginShape();
    for(int i=0;i<npoints;i++){
      vertex(xpoints[i]+xOffset,ypoints[i]+yOffset);
    } 
    endShape();
    }
}
