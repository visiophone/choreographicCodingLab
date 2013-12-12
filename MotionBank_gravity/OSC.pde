//val received
float val=0;

//id of the msh received
int tag=0;

void oscEvent(OscMessage theOscMessage) {
 
  val= theOscMessage.get(0).floatValue();
  //val=int(map(val, 0,600,0,300));
  //print(" addrpattern: "+theOscMessage.addrPattern());
String[] msgNr = split(theOscMessage.addrPattern(), '/');
tag=int(msgNr[1]);

if(tag==1) {
  pos1.x+=(theOscMessage.get(0).floatValue()-pos1.x)*0.3;
  pos1.y+=(theOscMessage.get(1).floatValue()-pos1.y)*0.3;    
}

if(tag==2) {
   pos2.x+=(theOscMessage.get(0).floatValue()-pos2.x)*0.3;
   pos2.y+=(theOscMessage.get(1).floatValue()-pos2.y)*0.3;   
}



}
