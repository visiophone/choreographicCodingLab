// Based on Attraction2D.pde example from Toxi physics lybrari.

// it starts with a black screen. 
// it takes some seconds to initiate all the particles.
// There is a central force in the center, two forces (attract 1 and attract2) 
// to interact and also another force in the mouse position
// Send the pos of each force (attract 1 and attract2) by OSC (check OSC tab).
// [/1 (float) (float)] and [/2 (float) float)]

// Developed during "Choreographic Coding Lab 2013", MotionLab
// Rodrigo Carvalho (www.visiophone-lab.com)

import oscP5.*;
import netP5.*;
import controlP5.*;
  
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

OscP5 oscP5;
ControlP5 cp5;

//iniciate particles
int NUM_PARTICLES = 700;
VerletPhysics2D physics;

//the lines that follow the points
ArrayList<Vec2D> follow;
float followerSize=0.1;

//attractor in the center of the screen
AttractionBehavior bigAtract;

// atractor attacher do hand 1 and hand 2 and to the mouse
AttractionBehavior atract1;
AttractionBehavior atract2;
AttractionBehavior atractMouse;


//position of the atractors/repelers
Vec2D pos1;
Vec2D pos2;
Vec2D posM;
Vec2D posMPrev;
Vec2D bigPos;

//force of the attractor/repellers
float bigForce=0.2;
float force1=0.5;
float force2=-0.5;
float forceM=-0.5;

void setup() {
size(1024,768);

//Start GUI
GUI();

// start oscP5, listening for incoming messages at port 12000 
oscP5 = new OscP5(this, 7400);
  
//iniciate particles and related stuff
follow = new ArrayList<Vec2D>(); 
physics = new VerletPhysics2D();
physics.setDrag(0.05f); //drag
physics.setWorldBounds(new Rect(0, 0, width, height)); //world
physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.0f))); //gravity

//iniciate atractors/reactors
posM = new Vec2D(0, height);
posMPrev = new Vec2D(0, height);
atractMouse = new AttractionBehavior(posM, 200, -0.0f);
bigPos= new Vec2D(width/2.0, height/2.0);
bigAtract = new AttractionBehavior (bigPos, 1000, 0.0f);
pos1 = new Vec2D(0, height);
atract1 = new AttractionBehavior(pos1, 350, -0.0f);
pos2 = new Vec2D(0, height);
atract2 = new AttractionBehavior(pos2, 350, -0.0f);



//add the atractors to the world
physics.addBehavior(bigAtract);
physics.addBehavior(atractMouse);
physics.addBehavior(atract1);
physics.addBehavior(atract2);

background(0); 
}

// inicializing particles
void addParticle() {
  VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(width / 2, height/2));
  physics.addParticle(p);
  // add a negative attraction force field around the new particle
  physics.addBehavior(new AttractionBehavior(p, 15, -1.2f, 0.01f));
   //following particle 
  follow.add(new Vec2D(p.x, p.y));
 
}


/////
void draw() {
 
  forceM=-0.5;
  
  background(0);
 fill(255);
 noStroke();
  

bigAtract.setStrength(bigForce);
//mouse force around
atractMouse.setAttractor(posM);
posM.x=mouseX;
posM.y=mouseY;
//println(aForce+" "+bForce+" "+cForce+" "+dForce);
//println(aPos.distanceTo(aPosPrev) );
posMPrev.x=posM.x;
posMPrev.y=posM.y;
//only works if mouse is pressed
if(mousePressed){ atractMouse.setStrength(forceM); }
else atractMouse.setStrength(0.0);

atract1.setAttractor(pos1);
//print(force1);
atract2.setAttractor(pos2);
atract1.setStrength(force1);
atract2.setStrength(force2);

  //iniciating the particles  
if (physics.particles.size() < NUM_PARTICLES) { addParticle(); }
physics.update();
int count=NUM_PARTICLES-1;

//Iterate through the all the particles
for (VerletParticle2D p : physics.particles) {  
 fill(255);
 noStroke();
 
 if (physics.particles.size() == NUM_PARTICLES) {
   
   stroke(220);
//draw the lines(followers)
line(p.x,p.y, follow.get(count).x,follow.get(count).y); 
follow.get(count).x+=(p.x-follow.get(count).x)*followerSize;
follow.get(count).y+=(p.y-follow.get(count).y)*followerSize;

// draw the particles dots
   fill(255);
   noStroke();
   //println(p);
   ellipse(p.x, p.y, 5, 5);
}
count--;
  }
  
// draw the atractors
fill(0);
stroke(150);
line(pos1.x, pos1.y,pos2.x, pos2.y);
ellipse(pos1.x, pos1.y, 10,10);
ellipse(pos2.x, pos2.y, 10,10);
  
}




