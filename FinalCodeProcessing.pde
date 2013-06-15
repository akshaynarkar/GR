  ///////////////////////////////////////////////////////////////
  // This is the code constructed for the scispace             //          
  // event for IEEE at SAKEC.                                  //
  //It is for the GUI control exercise                         //  
  //for using laptop to control robot                          // 
  //it is customized  from larry's code                        // 
  //Please feel free to use the code but mention the following //
  //(c) luckylarry.co.uk  (c) scispace.tk                      //
  /////////////////////////////////////////////////////////////// 
  
  //Serial Port Communication
  //No. of Commands sent to the arduino = 7.

import processing.serial.*; //Importing the Serial library 
Serial port;    // Serial is a Class for sending and receiving data using the serial communication protocol
PFont fontA; 

void setup()
{
  size(775,525); //Program window size
  port = new Serial(this, "COM5", 57600); // You may need to change the Com port by checking where the arduino is plugged in from  device manager. E.g COM4, COM15 
  // Baud rate  can be adjusted. Typical rates are 9600 and 57600. 
  fontA = loadFont("Eureka-90.vlw"); //Loading the font and giving it a specific name 
  

  textFont(fontA, 35);  // Set the font and its size (in units of pixels)
  
}

void draw() {
  
 rect(50,50, 250,250);  // rect (1,1) Note : Matrix numbering is used of a 2 by 3 matrix
 rect(250,50,250,250);  // rect (1,2) 
 rect(50,250,250,225);  // rect (1,3)
 rect(250,250,250,225); // rect (2,2)
 rect(500,50,225,250);  // rect (2,3)
 rect(500,250,225,225); // rect (2,3)
 rect(250,225,250,50);  // Central rectangle
  fill(0);
  text("Mouse Control Program",220 , 30); //text function used to enter text on the display window. Parameters are text,x co-ordinate,y co-ordinate
  fill(255); // 	Sets the color used to fill shapes. For example, if you run fill(204, 102, 0), all subsequent shapes will be filled with orange. This color is either specified in terms of the RGB or HSB color depending on the current colorMode().
 
 
  if (mousePressed)   //Variable storing if a mouse button is pressed. The value of the system variable mousePressed is true if a mouse button is pressed and false if a button is not pressed
 
 
  {
     if (mouseX > 50 && mouseY > 50  && mouseX < 250 && mouseY < 250  ) // Specifies the coordinates of the rect ==> (1,1) function = forward left ,character = 'b' 
   { 
      port.write('b'); //write()  Writes bytes, chars, ints, bytes[], Strings to the serial port  Note: The characters in the arduino code must match  
         fill(70);
   text("Forward Left",278 , 260);
      fill(255);
   }   
   
     else if ( mouseY > 50  &&   mouseX > 250 && mouseX < 500 && mouseY < 225 ) // rect (1,2) function = forward ,character = 'h'
   { 
     port.write('h');
     fill(70);
   text("Forward",315 , 260);
      fill(255);
  }
   else if ( mouseY > 50 && mouseX > 525 && mouseX < 725 && mouseY < 250 ) //rect (3,1) function = forward right ,character = 'a'
   { 
      port.write('a');
  fill(70);
   text("Forward Right",270 , 260);
      fill(255);
   }
   
   else if (  mouseX > 50  && mouseX < 250 && mouseY > 250  && mouseY < 475 )  //rect (1,2) function = backward right ,character = 'd'
   { 
      port.write('d');
   fill(0);
   text("Backward Left",265 , 260);
      fill(255);
   }
   
  else if (mouseX > 250 && mouseX < 500 && mouseY > 275   && mouseY < 475)  //rect (2,2) function = backward ,character = 'g'
  { 
      port.write('g');
    fill(0);
   text("Backward",305 , 260);
      fill(255);
   } 
   
     else if (mouseX > 500 && mouseX < 750 && mouseY > 250 && mouseX < 725 && mouseY < 475)  //rect (3,3) function = backward left ,character = 'c'
  { 
      port.write('c');
    fill(0);
   text("Backward Right",270 , 260);
      fill(255);
   } 
   
   else   // rect centre , function = stop , character = 'f'
   { 
      port.write('f');
     fill(0);
   text("Stop",340 , 260);
      fill(255);
   
  }  
  }
  else   //Not needed
  { 
      port.write('f');
     fill(0);
   text("Stop",340 , 260);
      fill(255);
   
  } 
 
}
