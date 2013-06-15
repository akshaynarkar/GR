

  ///////////////////////////////////////////////////////////////
  // This is the code constructed for the scispace             //          
  // event for IEEE at SAKEC.                                  //
  //It is for the GUI control exercise                         //  
  //for using laptop to control robot                          // 
  //it is customized  from larry's code                        // 
  //Please feel free to use the code but mention the following //
  //(c) luckylarry.co.uk  (c) scispace.tk                      //
  ///////////////////////////////////////////////////////////////  
import processing.serial.*; //Importing the Serial library
Serial port;	// Serial is a Class for sending and receiving data using the serial communication protocol
String currDirection;
PFont fontA;
void setup() {
  size(1200, 1200);  //Program window size
  background(255);
  
 
  port = new Serial(this, "COM3", 57600); // You may need to change the Com port by checking where the arduino is plugged in from  device manager. E.g COM4, COM15 
  // Baud rate  can be adjusted. Typical rates are 9600 and 57600.  
    fontA = loadFont("Eureka-90.vlw"); //Loading the font and giving it a specific name
  

  textFont(fontA, 35);   // Set the font and its size (in units of pixels)
}


void draw() {
 println("Current direction is " + currDirection);

if (mousePressed)//Variable storing if a mouse button is pressed. The value of the system variable mousePressed is true if a mouse button is pressed and false if a button is not pressed
{ play();  //Calls the function play() everytime the mouse is pressed
}
else 
   {
     port.write('f');
     currDirection = "stop";  
    
      fill(255); // 	Sets the color used to fill shapes. For example, if you run fill(204, 102, 0), all subsequent shapes will be filled with orange. This color is either specified in terms of the RGB or HSB color depending on the current colorMode().
       background(255);
  }
  
}


 void play ()
 {

   
  rect(mouseX, mouseY, 10, 10);  //YOu can also use an ellipse 
  // find direction
  if (mouseX < pmouseX && mouseY < pmouseY) // 	The system variable pmouseX always contains the horizontal position of the mouse in the frame previous to the current frame.
  //By comparing these , we can assume the direction of displacement.
  // you can even use mouseDragged() 
  
   { 
    port.write('d');//write()  Writes bytes, chars, ints, bytes[], Strings to the serial port  Note: The characters in the arduino code must match  
    currDirection = "left";
     fill(0);
   text("Forward Left",200, 200); //text function used to enter text on the display window. Parameters are text,x co-ordinate,y co-ordinate
      fill(255);     //try changing the values to get different colour fonts
       
   }
  
 else if (mouseX > pmouseX && mouseY < pmouseY) 
  { 
     port.write('c');
     currDirection = "right";
     fill(0);
   text("Forward Right",800 , 200);
      fill(255);
      
  }
  else if (mouseX < pmouseX && mouseY > pmouseY) 
  
   { 
    port.write('b');
    currDirection = "right";
      fill(0);
   text("Backward Left",200 , 600);
      fill(255);
 
       
   }
   else if (mouseX > pmouseX && mouseY > pmouseY) 
  { 
     port.write('a');
     currDirection = "left";
     fill(0);
   text("Backward Right",800, 600);
      fill(255);
     
  }
   else if (mouseY < pmouseY ) 
  
   { 
     port.write('h');
     currDirection = "Forward";
      fill(0);
   text("Forward",550 , 200);
      fill(255);
      
   }
   else if (mouseY > pmouseY) 
  
   {
     port.write('g');
     currDirection = "Backward";
      fill(0);
   text("Backward",550 , 600);
      fill(255);
      
   }
   else if ( mouseX == pmouseX && mouseY == pmouseY) // IF the pointer hasn't moved.. Then the values of pmouseX and mouseX will be same.
  
  {
     port.write('f'); //'f' tells the arduino to stop sending any signals to the rf module
     currDirection = "stop";
      
  }
   
}
 
