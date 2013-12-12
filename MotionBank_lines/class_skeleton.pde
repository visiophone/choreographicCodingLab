class NuiSkeletonData
{
    int skeletonId;

    int[] frame;
    int[] validity;
    int[] timestamp;
    
    int currentFrame = 0;

    Point3D[] head;
    Point3D[] shoulderLeft;
    Point3D[] shoulderCenter;
    Point3D[] shoulderRight;
    Point3D[] elbowLeft;
    Point3D[] elbowRight;
    Point3D[] wristLeft;
    Point3D[] wristRight;
    Point3D[] handLeft;
    Point3D[] handRight;
    Point3D[] spine;
    Point3D[] hipLeft;
    Point3D[] hipCenter;
    Point3D[] hipRight;
    Point3D[] kneeLeft;
    Point3D[] kneeRight;
    Point3D[] ankleLeft;
    Point3D[] ankleRight;
    Point3D[] footLeft;
    Point3D[] footRight;
    
    Point3D[][] skeleton;

    NuiSkeletonData ( int id, int frames )
    {
        skeletonId = id;

        frame = new int[frames];
        validity = new int[frames];
        timestamp = new int[frames];

        head = new Point3D[frames];
        shoulderLeft = new Point3D[frames];
        shoulderCenter = new Point3D[frames];
        shoulderRight = new Point3D[frames];
        elbowLeft = new Point3D[frames];
        elbowRight = new Point3D[frames];
        wristLeft = new Point3D[frames];
        wristRight = new Point3D[frames];
        handLeft = new Point3D[frames];
        handRight = new Point3D[frames];
        spine = new Point3D[frames];
        hipLeft = new Point3D[frames];
        hipCenter = new Point3D[frames];
        hipRight = new Point3D[frames];
        kneeLeft = new Point3D[frames];
        kneeRight = new Point3D[frames];
        ankleLeft = new Point3D[frames];
        ankleRight = new Point3D[frames];
        footLeft = new Point3D[frames];
        footRight = new Point3D[frames];
        
        skeleton = new Point3D[][]{
            hipCenter,
            spine,
            shoulderCenter,
            head,
            shoulderLeft,
            elbowLeft,
            wristLeft,
            handLeft,
            shoulderRight,
            elbowRight,
            wristRight,
            handRight,
            hipLeft,
            kneeLeft,
            ankleLeft,
            footLeft,
            hipRight,
            kneeRight,
            ankleRight,
            footRight
        };
    }
    
    void addFrame ( String data )
    {
        int i = currentFrame;
        currentFrame++;
        
        String[] pieces = data.split(",");
        
        for ( int k = 0; k < pieces.length; k++ )
        {
            pieces[k] = pieces[k].replace("(","").replace(")","");
        }
        
        frame[i] = int( pieces[0].trim() );
        validity[i] = int( pieces[1].trim() );
        timestamp[i] = int( pieces[2].trim() );
        
        for ( int s = 0, n = 4; n < pieces.length && s < skeleton.length; n++, s++ )
        {
            String[] point3d = pieces[n].trim().split(" ");
            
            skeleton[s][i] = new Point3D(
                float(point3d[0]),
                float(point3d[1]),
                -float(point3d[2])
            );
        }
    }
    
    void next ()
    {
        currentFrame++;
        currentFrame %= frame.length;
    }
    
    void draw ()
    {
        noStroke();
        drawJoints();
        noFill();
        stroke( 255 );
        drawConnections();
    }
    
    void drawJoints ()
    {
        int i = currentFrame;
        
        fill( 250 );
        drawJoint( head[i].x,           head[i].y,           head[i].z );
        drawJoint( shoulderCenter[i].x, shoulderCenter[i].y, shoulderCenter[i].z );
        drawJoint( shoulderLeft[i].x,   shoulderLeft[i].y,   shoulderLeft[i].z );
        drawJoint( shoulderRight[i].x,  shoulderRight[i].y,  shoulderRight[i].z );
        
        fill( 250 );
        drawJoint( elbowLeft[i].x,      elbowLeft[i].y,      elbowLeft[i].z );
        drawJoint( elbowRight[i].x,     elbowRight[i].y,     elbowRight[i].z );
        drawJoint( wristLeft[i].x,      wristLeft[i].y,      wristLeft[i].z );
        drawJoint( wristRight[i].x,     wristRight[i].y,     wristRight[i].z );
        drawJoint( handLeft[i].x,       handLeft[i].y,       handLeft[i].z );
        drawJoint( handRight[i].x,      handRight[i].y,      handRight[i].z );
        
        fill( 250 );
        drawJoint( spine[i].x,          spine[i].y,          spine[i].z );
        drawJoint( hipLeft[i].x,        hipLeft[i].y,        hipLeft[i].z );
        drawJoint( hipCenter[i].x,      hipCenter[i].y,      hipCenter[i].z );
        drawJoint( hipRight[i].x,       hipRight[i].y,       hipRight[i].z );
        drawJoint( kneeLeft[i].x,       kneeLeft[i].y,       kneeLeft[i].z );
        drawJoint( kneeRight[i].x,      kneeRight[i].y,      kneeRight[i].z );
        drawJoint( ankleLeft[i].x,      ankleLeft[i].y,      ankleLeft[i].z );
        drawJoint( ankleRight[i].x,     ankleRight[i].y,     ankleRight[i].z );
        drawJoint( footLeft[i].x,       footLeft[i].y,       footLeft[i].z );
        drawJoint( footRight[i].x,      footRight[i].y,      footRight[i].z );
    }
    
    void drawConnections ()
    {
        int i = currentFrame;
        
        drawConnection( head[i], shoulderCenter[i] );
        drawConnection( shoulderCenter[i], spine[i] );
        drawConnection( spine[i], hipCenter[i] );
        
        drawConnection( shoulderCenter[i], shoulderLeft[i] );
        drawConnection( shoulderLeft[i], elbowLeft[i] );
        drawConnection( elbowLeft[i], wristLeft[i] );
        drawConnection( wristLeft[i], handLeft[i] );
        
        drawConnection( shoulderCenter[i], shoulderRight[i] );
        drawConnection( shoulderRight[i], elbowRight[i] );
        drawConnection( elbowRight[i], wristRight[i] );
        drawConnection( wristRight[i], handRight[i] );
        
        drawConnection( hipCenter[i], hipLeft[i] );
        drawConnection( hipLeft[i], kneeLeft[i] );
        drawConnection( kneeLeft[i], ankleLeft[i] );
        drawConnection( ankleLeft[i], footLeft[i] );
        
        drawConnection( hipCenter[i], hipRight[i] );
        drawConnection( hipRight[i], kneeRight[i] );
        drawConnection( kneeRight[i], ankleRight[i] );
        drawConnection( ankleRight[i], footRight[i] );
    }
    
    void drawConnection ( Point3D from, Point3D to )
    {
        line( from.x, from.y, from.z, to.x, to.y, to.z );
    }
    
    void drawJoint ( float x, float y, float z )
    {
        pushMatrix();
        translate( x, y, z );
        sphere( 0.05 );
        popMatrix();
    }
    
    Point3D spine ()
    {
        return spine[currentFrame];
    }
    
    Point3D hipCenter ()
    {
        return hipCenter[currentFrame];
    }
}

class Point3D
{
    float x, y, z;

    Point3D ( float _x, float _y, float _z ) 
    {
        x = _x;
        y = _y;
        z = _z;
    }
}

