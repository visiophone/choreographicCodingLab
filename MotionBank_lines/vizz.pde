public class Linnes
{
    float x, y, xx, yy;
    float[][] linesPos;
    
    float offSet;
    //nr lines
    int nr;  
    Linnes ( float x1, float y1, float x2, float y2 )
    {
        x = x1; y = y1; xx=x2; yy=y2;    
        nr=50;
        stroke(255);      
       linesPos = new float[nr][4];
       offSet=0;
       
       for (int i=0; i<nr; i++){
         
         linesPos[i][0]=x;
         linesPos[i][1]=y;
         linesPos[i][2]=xx;
         linesPos[i][3]=yy;  
       } 
    }
    
    void draw (float offSett) 
    {
     // xPre=x; yPre=y;xxPre=xx;yyPre=yy;
     offSet=offSett;
     stroke(255);
      for (int i=0; i<nr; i++){
        
         linesPos[i][0]+=(x-linesPos[i][0])*(map(i,0,nr,0.03,0.6));
         linesPos[i][1]+=(y-linesPos[i][1])*(map(i,0,nr,0.03,0.6));
         linesPos[i][2]+=(xx-linesPos[i][2])*(map(i,0,nr,0.03,0.6));
         linesPos[i][3]+=(yy-linesPos[i][3])*(map(i,0,nr,0.03,0.6));
        
     if(mode<=4)    line(linesPos[i][0]+offSet,linesPos[i][1],linesPos[i][2]+offSet,linesPos[i][3]);
     if(mode==5) {
       
       noFill();
         beginShape();
         curveVertex(linesPos[i][0]+offSet,500);
       curveVertex(linesPos[i][0]+offSet,linesPos[i][1]);
       curveVertex(linesPos[i][2]+offSet,linesPos[i][3]);
       curveVertex(linesPos[i][0]+offSet,600);
       endShape();
       }
       
          if(mode==6) {
       
       noFill();
         beginShape();
          curveVertex(linesPos[i][0]+offSet,linesPos[i][1]);
         curveVertex(width/2,0);
         curveVertex(width/2,height);
        curveVertex(linesPos[i][2]+offSet,linesPos[i][3]);
       endShape();
       }
       
      } 
       
    }
    
     void update (float x1, float y1, float x2, float y2) 
    {
        
  //Dirty mapping points to fit the screen
  x = map(x1, 0.8,0,0,600); 
  y = map(y1, 0.5,-0.5,100,550);  
  xx= map(x2, 0.8,0,0,600); 
  yy= map(y2, 0.5,-0.5,100,550); 
//println(x+" "+y+" "+xx+" "+yy);
  
    }
}
