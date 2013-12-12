int xx1=0;
int xx2=0;
int yy1=0;
int yy2=0;

boolean type=true;

boolean saveF=false;

void drawVizz (){
 
 // textSize(12);
  textMode(SCREEN);
  //Jonathan on the left, Matheo on the right
//  println("J Hands");
 // println( skeletonJ.handRight[skeletonJ.currentFrame].x+" "+skeletonJ.handLeft[skeletonJ.currentFrame].x+" | "+skeletonJ.handRight[skeletonJ.currentFrame].y+" "+skeletonJ.handLeft[skeletonJ.currentFrame].y);
 //println("H Head");
 //println( skeletonJ.head[skeletonJ.currentFrame].x+" "+skeletonJ.head[skeletonJ.currentFrame].y);
//mode 1 -> connect left hand width right hand on both dancers
fill(255);
text(skeletonJ.currentFrame, 30, height-70);

if(mode==1){  
  
  if(type){
  fill(255);
  text("JONATHAN-LEFT | MATHEO-RIGHT",30,height-45);
  text("RIGHT HAND CONNECTED TO LEFT HAND", 30,height-30); 
  }
 //rightHand - LeftHand J
 linnes1.update(skeletonJ.handRight[skeletonJ.currentFrame].x,skeletonJ.handRight[skeletonJ.currentFrame].y,skeletonJ.handLeft[skeletonJ.currentFrame].x,skeletonJ.handLeft[skeletonJ.currentFrame].y);
 linnes1.draw(100);


 //rightHand - LeftHand M
 linnes2.update(skeletonM.handRight[skeletonM.currentFrame].x,skeletonM.handRight[skeletonM.currentFrame].y,skeletonM.handLeft[skeletonM.currentFrame].x,skeletonM.handLeft[skeletonM.currentFrame].y);
 linnes2.draw(0);  
}


if(mode==2){
  
  if(type){
  fill(255);
  text("JONATHAN-LEFT | MATHEO-RIGHT",30,height-45);
  text("TRIANGLE BETWEEN HEAD LEFT HAND AND RIGHT HAND", 30,height-30);
  }
 linnes1.update(skeletonJ.handRight[skeletonJ.currentFrame].x,skeletonJ.handRight[skeletonJ.currentFrame].y,skeletonJ.handLeft[skeletonJ.currentFrame].x,skeletonJ.handLeft[skeletonJ.currentFrame].y);
 linnes1.draw(100);
 
 linnes2.update(skeletonJ.handRight[skeletonJ.currentFrame].x,skeletonJ.handRight[skeletonJ.currentFrame].y,skeletonJ.head[skeletonJ.currentFrame].x,skeletonJ.head[skeletonJ.currentFrame].y);
 linnes2.draw(100);
 
 linnes3.update(skeletonJ.head[skeletonJ.currentFrame].x,skeletonJ.head[skeletonJ.currentFrame].y,skeletonJ.handLeft[skeletonJ.currentFrame].x,skeletonJ.handLeft[skeletonJ.currentFrame].y);
 linnes3.draw(100);

 //println(skeletonJ.head[skeletonJ.currentFrame].x+" "+skeletonJ.head[skeletonJ.currentFrame].y);
 
 linnes4.update(skeletonM.handRight[skeletonM.currentFrame].x,skeletonM.handRight[skeletonM.currentFrame].y,skeletonM.handLeft[skeletonM.currentFrame].x,skeletonM.handLeft[skeletonM.currentFrame].y);
 linnes4.draw(0);
 linnes5.update(skeletonM.handRight[skeletonM.currentFrame].x,skeletonM.handRight[skeletonM.currentFrame].y,skeletonM.head[skeletonM.currentFrame].x,skeletonM.head[skeletonM.currentFrame].y);
 linnes5.draw(0);
 linnes6.update(skeletonM.handLeft[skeletonM.currentFrame].x,skeletonM.handLeft[skeletonM.currentFrame].y,skeletonM.head[skeletonM.currentFrame].x,skeletonM.head[skeletonM.currentFrame].y);
 linnes6.draw(0);
}
  
  
  if(mode==3){
   
    if(type){
    fill(255);
    text("JONATHAN-LEFT | MATHEO-RIGHT",30,height-45);
    text("Horizontal Lines connecting parallel joints between both", 30,height-30); 
    }
    
     linnes1.update(skeletonJ.handRight[skeletonJ.currentFrame].x,skeletonJ.handRight[skeletonJ.currentFrame].y,skeletonM.handLeft[skeletonJ.currentFrame].x,skeletonM.handLeft[skeletonJ.currentFrame].y);
     linnes1.draw(100);
     linnes2.update(skeletonJ.head[skeletonJ.currentFrame].x,skeletonJ.head[skeletonJ.currentFrame].y,skeletonM.head[skeletonJ.currentFrame].x,skeletonM.head[skeletonJ.currentFrame].y);
     linnes2.draw(100);
      linnes3.update(skeletonJ.spine[skeletonJ.currentFrame].x,skeletonJ.spine[skeletonJ.currentFrame].y,skeletonM.spine[skeletonJ.currentFrame].x,skeletonM.spine[skeletonJ.currentFrame].y);
     linnes3.draw(100);
     linnes4.update(skeletonJ.footRight[skeletonJ.currentFrame].x,skeletonJ.footRight[skeletonJ.currentFrame].y,skeletonM.footLeft[skeletonJ.currentFrame].x,skeletonM.footLeft[skeletonJ.currentFrame].y);
     linnes4.draw(100);
 
     linnes5.update(skeletonJ.shoulderCenter[skeletonJ.currentFrame].x,skeletonJ.shoulderCenter[skeletonJ.currentFrame].y,skeletonM.shoulderCenter[skeletonJ.currentFrame].x,skeletonM.shoulderCenter[skeletonJ.currentFrame].y);
     linnes5.draw(100);
    
    linnes6.update(skeletonJ.kneeLeft[skeletonJ.currentFrame].x,skeletonJ.kneeLeft[skeletonJ.currentFrame].y,skeletonM.kneeRight[skeletonJ.currentFrame].x,skeletonM.kneeRight[skeletonJ.currentFrame].y);
    linnes6.draw(100);
    
  }
  
    if(mode==4){
   
      if(type){
    fill(255);
    text("JONATHAN-LEFT | MATHEO-RIGHT",30,height-45);
    text("2 RHOMBUS BETWEEN TOP POIN INTERNAL/EXTERNAL HANDS AND BOTTOM POINT", 30,height-30); 
      }
   linnes1.update(0.08,0.74,skeletonJ.handLeft[skeletonJ.currentFrame].x,skeletonJ.handLeft[skeletonJ.currentFrame].y);
   linnes1.draw(100);
    linnes2.update(0.08,-0.88,skeletonJ.handLeft[skeletonJ.currentFrame].x,skeletonJ.handLeft[skeletonJ.currentFrame].y);
   linnes2.draw(100);
   
   linnes3.update(0.08,0.74,skeletonM.handRight[skeletonJ.currentFrame].x,skeletonM.handRight[skeletonJ.currentFrame].y);
   linnes3.draw(100);
   linnes4.update(0.08,-0.88,skeletonM.handRight[skeletonJ.currentFrame].x,skeletonM.handRight[skeletonJ.currentFrame].y);
   linnes4.draw(100);
   
     linnes5.update(0.08,0.74,skeletonJ.handRight[skeletonJ.currentFrame].x,skeletonJ.handRight[skeletonJ.currentFrame].y);
   linnes5.draw(100);
    linnes6.update(0.08,-0.88,skeletonJ.handRight[skeletonJ.currentFrame].x,skeletonJ.handRight[skeletonJ.currentFrame].y);
   linnes6.draw(100);
   
   linnes7.update(0.08,0.74,skeletonM.handLeft[skeletonJ.currentFrame].x,skeletonM.handLeft[skeletonJ.currentFrame].y);
   linnes7.draw(100);
   linnes8.update(0.08,-0.88,skeletonM.handLeft[skeletonJ.currentFrame].x,skeletonM.handLeft[skeletonJ.currentFrame].y);
   linnes8.draw(100);
   
   }
   
    if(mode==5){
   
      if(type){
    fill(255);
    text("JONATHAN-LEFT | MATHEO-RIGHT",30,height-45);
    text("curves from head to elbows and hands",30,height-30);
   
  
   linnes1.update(skeletonJ.head[skeletonJ.currentFrame].x+0.02,skeletonJ.head[skeletonJ.currentFrame].y,skeletonJ.handRight[skeletonJ.currentFrame].x,skeletonJ.handRight[skeletonJ.currentFrame].y);
   linnes2.update(skeletonJ.head[skeletonJ.currentFrame].x-0.02,skeletonJ.head[skeletonJ.currentFrame].y,skeletonJ.handLeft[skeletonJ.currentFrame].x,skeletonJ.handLeft[skeletonJ.currentFrame].y);
   
   linnes3.update(skeletonJ.head[skeletonJ.currentFrame].x+0.02,skeletonJ.head[skeletonJ.currentFrame].y,skeletonJ.elbowRight[skeletonJ.currentFrame].x,skeletonJ.elbowRight[skeletonJ.currentFrame].y);
   linnes4.update(skeletonJ.head[skeletonJ.currentFrame].x-0.02,skeletonJ.head[skeletonJ.currentFrame].y,skeletonJ.elbowLeft[skeletonJ.currentFrame].x,skeletonJ.elbowLeft[skeletonJ.currentFrame].y);
 

 linnes1.draw(100);
  linnes2.draw(100);
  linnes3.draw(100);
  linnes4.draw(100);
  
   linnes5.update(skeletonM.head[skeletonJ.currentFrame].x+0.02,skeletonM.head[skeletonJ.currentFrame].y,skeletonM.handRight[skeletonJ.currentFrame].x,skeletonM.handRight[skeletonJ.currentFrame].y);
   linnes6.update(skeletonM.head[skeletonJ.currentFrame].x-0.02,skeletonM.head[skeletonJ.currentFrame].y,skeletonM.handLeft[skeletonJ.currentFrame].x,skeletonM.handLeft[skeletonJ.currentFrame].y);
   
   linnes7.update(skeletonM.head[skeletonJ.currentFrame].x+0.02,skeletonM.head[skeletonJ.currentFrame].y,skeletonM.elbowRight[skeletonJ.currentFrame].x,skeletonM.elbowRight[skeletonJ.currentFrame].y);
   linnes8.update(skeletonM.head[skeletonJ.currentFrame].x-0.02,skeletonM.head[skeletonJ.currentFrame].y,skeletonM.elbowLeft[skeletonJ.currentFrame].x,skeletonM.elbowLeft[skeletonJ.currentFrame].y);
 

   linnes5.draw(0);
  linnes6.draw(0);
  linnes7.draw(0);
  linnes8.draw(0);

      }
      
    }
    
    
    
     if(mode==6){
   
      if(type){
    fill(255);
    text("JONATHAN-LEFT | MATHEO-RIGHT",30,height-45);
    text("more curves",30,height-30);
   
  
   linnes1.update(skeletonJ.handRight[skeletonJ.currentFrame].x*5,skeletonJ.handRight[skeletonJ.currentFrame].y+0.4*5,skeletonJ.footLeft[skeletonJ.currentFrame].x*5,skeletonJ.footLeft[skeletonJ.currentFrame].y+0.4*5);
   linnes2.update(skeletonM.handLeft[skeletonJ.currentFrame].x*5,skeletonM.handLeft[skeletonJ.currentFrame].y*5,skeletonM.footRight[skeletonJ.currentFrame].x*5,skeletonM.footRight[skeletonJ.currentFrame].y*5);
   
 linnes1.draw(100);
 linnes2.draw(100);



      }
      
    }
    
  
  
  if(saveF && frameCount%5==0){
   saveFrame("pics/uno-####.png");
  println("saving "+frameCount); 
  }
  
}



void keyPressed()
{
  
  if(key=='d' || key=='D') sDraw=!sDraw; 
 
 // show hide text
  if(key=='t' || key=='T') type=!type; 
 
 //change mode
 if(key=='1') mode=1;
 if(key=='2') mode=2; 
 if(key=='3') mode=3;
 
 if(key=='4') mode=4;
 if(key=='5') mode=5;
 if(key=='6') mode=6;
 
 if(key=='s' || key=='S') saveF=!saveF;
}
