void GUI(){
  
 
   cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("bigForce")
     .setPosition(20 ,20)
     .setSize(150,15)
     .setRange(-1.0,1.0)
     ; 
     
     
      cp5.addSlider("forceM")
     .setPosition(20 ,40)
     .setSize(150,15)
     .setRange(-1,1)
     ; 
     
      cp5.addSlider("force1")
     .setPosition(20 ,60)
     .setSize(150,15)
     .setRange(-1,1)
     ;
     
      cp5.addSlider("force2")
     .setPosition(20 ,80)
     .setSize(150,15)
     .setRange(-1,1)
     ;
     
     cp5.addSlider("followerSize")
     .setPosition(20 ,100)
     .setSize(150,15)
     .setRange(0.01,0.2)
     ;
  

  
}

void keyPressed() {
  
 //  if (key=='m' || key=='M'){cp5.controlP5("bigForce").hide();}
   //if (key=='n' || key=='N'){ cp5.Controller("bigForce").show();}
     

   
  
  
}
