public class Slider
{
    float x, y, width, height;
    float valueX = 0, value;
    
    Slider ( float xx, float yy, float ww, float hh ) 
    {
        x = xx; y = yy; width = ww; height = hh;
        valueX = x;
        Interactive.add( this );
    }
    
    void setValue ( float v )
    {
        if ( v >= 0 && v <= 1 )
        {
            value = v;
            valueX = map( value, 0, 1, x, x+width-height );
        }
    }
    
    void mouseDragged ( float mx, float my )
    {
        valueX = mx - height/2;
        
        if ( valueX < x ) valueX = x;
        if ( valueX > x+width-height ) valueX = x+width-height;
        
        value = map( valueX, x, x+width-height, 0, 1 );
        
        skeletonJ.currentFrame = int( map( value, 0, 1, 0, skeletonJ.frame.length ) );
        skeletonM.currentFrame = skeletonJ.currentFrame;
    }

    void draw () 
    {
        noStroke();
        
        fill( 100 );
        rect(x, y, width, height);
        
        fill( 120 );
        rect( valueX, y, height, height );
    }
}
