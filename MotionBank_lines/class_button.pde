public class Button
{
    float x, y, width, height;
    boolean on = true;
    
    Button ( float xx, float yy, float w, float h )
    {
        x = xx; y = yy; width = w; height = h;
        
        Interactive.add( this );
    }
    
    void mousePressed () 
    {
        on = !on;
        println("on");
    }
    
    void draw () 
    {
        noStroke();
        
        if ( on ) fill( 200 );
        else fill( 100 );
        
       // rect(x, y, width, height);
    }
}
