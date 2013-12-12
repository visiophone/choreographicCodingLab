
// Based on the Motion data parser made by Florian. 

// Click '1', '2', '3', '4', '5' to change mode
// Click 's' to save stills

// it only works in Processing 1.5 (because of "de.bezier.guido" library).

// Developed during "Choreographic Coding Lab 2013", MotionLab
// Rodrigo Carvalho (www.visiophone-lab.com)

import processing.opengl.*;
import de.bezier.guido.*;


NuiSkeletonData skeletonJ, skeletonM;

// draggin lines Class
Linnes linnes1;
Linnes linnes2;
Linnes linnes3;
Linnes linnes4;
Linnes linnes5;
Linnes linnes6;
Linnes linnes7;
Linnes linnes8;

// diferent mode of visualization
int mode=1;

//draw/noDraw skeleton on the top
boolean sDraw=false;

boolean resetVid=false;

Slider slider;
Button button;
float rotY = 0;
boolean loaded;



void setup ()
{
    size( 1280 , 720, P3D );
    
    smooth();
    

    linnes1 = new Linnes(0,0,0,0);
    linnes2 = new Linnes(width,height,width,height);
    linnes3 = new Linnes(0,0,0,0);
    linnes4 = new Linnes(0,0,0,0);
    linnes5 = new Linnes(0,0,0,0);
    linnes6 = new Linnes(0,0,0,0);
    linnes7 = new Linnes(0,0,0,0);
    linnes8 = new Linnes(0,0,0,0);
    
    Interactive.make(this);
    button = new Button(0,height-10,10,10);
    slider = new Slider(10,height-10,width-10, 10);
    
    new Thread(){
        public void run () {
            loadSkeletons();
            loaded = true;

          
        }
    }.start();
    
    frameRate( 30 );
}



void draw ()
{
   background( 0 );
   //if(resetVid)vid.jump(
  //stroke(200); 
line(width/2, 0, width/2,height);   
    if ( loaded )
    {       
   
      // the performance only starts at frame 2100. before there are some calibration stuff.
      //loop again to frame nr 2100. after the calibration
    if( skeletonJ.currentFrame>33000){skeletonJ.currentFrame=2100; skeletonM.currentFrame=2100;}
     
      //// draw skeleton
     if(sDraw){ fill(0,100); rect(0,0,width,height);}
     
     drawVizz();
     

        pushMatrix();
       
        fill( 255 );
        noStroke();
        translate( width/2, height/2, 0 );
        pushMatrix();
         
        rotateX( PI );
        rotateY( rotY + PI );
        scale( 200 );
        pushMatrix();
        translate( 1, 0, 0 );
        translate( -skeletonJ.hipCenter().x, -skeletonJ.hipCenter().y, -skeletonJ.hipCenter().z );
        if ( button.on )
        {
            skeletonJ.next();
            slider.setValue( map(skeletonJ.currentFrame, 0, skeletonJ.frame.length, 0, 1) );
        }
        
        fill(255,22,23);
          
        if(sDraw)skeletonJ.draw(); 
      // println(skeletonJ.handRight[skeletonJ.currentFrame].y+" "+skeletonJ.handLeft[skeletonJ.currentFrame].y);
       
        popMatrix();
        pushMatrix();
        translate( -1, 0, 0 );
        translate( -skeletonM.hipCenter().x, -skeletonM.hipCenter().y, -skeletonM.hipCenter().z );
        if ( button.on )
        {
            skeletonM.next();
            slider.setValue( map(skeletonM.currentFrame, 0, skeletonM.frame.length, 0, 1) );
        }
        if(sDraw) skeletonM.draw();
        popMatrix();
        popMatrix();
        popMatrix();
        
        
 
    }
    else
    {
        fill( 255 );
        text( "loading", width/2, height/2 );
    }
}

void mouseDragged ()
{
    if ( mouseY < height-10 ) 
    {
        rotY = map( mouseX, 0, width, -HALF_PI/2, HALF_PI/2);
    }
}




void loadSkeletons ()
{
    String[] lines = loadStrings("FusedSkeletonData_Position_MappedTo30FPS-1.txt");
    String[] linesClean = new String[lines.length];
    int linesTotal = 0;
    for ( String l : lines )
    {
        if ( l.indexOf('#') == -1 ) 
        {
            linesClean[linesTotal] = l;
            linesTotal++;
        }
    }
    skeletonJ = new NuiSkeletonData(0,linesTotal);
    for ( int i = 0; i < linesTotal; i++ )
    {
        skeletonJ.addFrame( linesClean[i] );
    }
    //jumping to the frame 2100 to avoid the calibration
    skeletonJ.currentFrame = 2100;
    
    lines = loadStrings("FusedSkeletonData_Position_MappedTo30FPS-2.txt");
    linesClean = new String[lines.length];
    linesTotal = 0;
    for ( String l : lines )
    {
        if ( l.indexOf('#') == -1 ) 
        {
            linesClean[linesTotal] = l;
            linesTotal++;
        }
    }
    skeletonM = new NuiSkeletonData(0,linesTotal);
    for ( int i = 0; i < linesTotal; i++ )
    {
        skeletonM.addFrame( linesClean[i] );
    }
     //jumping to the frame 2100 to avoid the calibration
    skeletonM.currentFrame = 2100;
    
    println( skeletonJ.frame.length + " " + skeletonM.frame.length );
}



