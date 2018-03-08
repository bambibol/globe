/* //<>//
 TUIO 1.1 Demo for Processing
 Copyright (c) 2005-2016 Martin Kaltenbrunner <martin@tuio.org>

 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files
 (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge,
 publish, distribute, sublicense, and/or sell copies of the Software,
 and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
 ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// import the TUIO library
import TUIO.*;
// declare a TuioProcessing client
TuioProcessing tuioClient;

color[] idsToColors = { color(255,255,0), color(255), color(255), color(255), color(255), color(255,0,0), color(255), color(255), color(255),color(255), color(255)};
  

// these are some helper variables which are used
// to create scalable graphical feedback
float object_size = 60;
float table_size = 760;
float scale_factor = 1;

boolean callback = true; // updates only after callbacks

Grid myGrid;

void setup(){
  fullScreen();
  myGrid = new Grid(width,height);
  
  // GUI setup
  noCursor();
  
  // periodic updates
  if (!callback) {
    loop();
    frameRate(60); //<>//
  } else noLoop(); // or callback updates 
  
  scale_factor = height/table_size;
  
  // finally we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods in this class (see below)
  tuioClient  = new TuioProcessing(this);
}

// within the draw method we retrieve an ArrayList of type <TuioObject>, <TuioCursor> or <TuioBlob>
// from the TuioProcessing client and then loops over all lists to draw the graphical feedback.
void draw()
{
    background(0);
    //PImage bgimg;
    //bgimg = loadImage("bg.jpg");
    //background(bgimg);
    int grid = 30; // change this number to 20 or 50, etc., if you want fewer grid lines

    for (int i = 0; i < width; i+=grid) {
    //  line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=grid) {
      //line (0, i, width, i);
    }
      
     
    
  
    float obj_size = object_size*scale_factor; 
     
    ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
    
    myGrid.draw( tuioObjectList );
    
    
    for (int i=0;i<tuioObjectList.size();i++) {
       TuioObject tobj = tuioObjectList.get(i);
       //println(tobj.getSymbolID()); // the id of the found object
       stroke(255,255,255);
       
       if (tobj.getSymbolID()<idsToColors.length) {
         fill(idsToColors[ tobj.getSymbolID()],64);
       } else {
         fill(0);
       }
       
       
       
       pushMatrix();
       translate(tobj.getScreenX(width),tobj.getScreenY(height));
       
       ellipseMode(CORNER);
       ellipse(-obj_size/2,-obj_size/2,obj_size,obj_size);
       popMatrix();
       fill(255);
   }
      
}


// --------------------------------------------------------------
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (callback) redraw();
}