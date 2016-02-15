
/*
 *  Simple implementation of a LOGO style turtle to draw with
 */


class Turtle
{
  //int delayTime = 500;  
  
  public color colour;
  public float weight;

  private boolean penDown;

  private PVector   position;
  private PVector   lastPosition;
  private float   heading;

  Turtle(  )
  {
    colour = color( 100, 100, 100 );
    weight = 2;

    position     = new PVector( width/2, height/2 );
    lastPosition = new PVector( width/2, height/2 );
    heading      = radians(-90);
    penDown      = true;
  }

  void forward( float distance )
  {
    PVector moveVec = PVector.fromAngle( heading );
    moveVec.mult( distance );
    lastPosition = position.copy();
    position.add( moveVec );

    drawMove();
    //delay( delayTime );
  }

  void left( float degrees )
  {
    heading -= radians(degrees);
    heading  = heading % TWO_PI;
  }

  void right( float degrees )
  {
    heading += radians(degrees);
    heading  = heading % TWO_PI;
  }

  void penDown()
  {
    penDown = true;
  }

  void penUp()
  {
    penDown = false;
  }

  void drawMove()
  {
    if ( penDown )
    {
      stroke( colour );
      strokeWeight( weight );
      line( lastPosition.x, lastPosition.y, position.x, position.y );
    } else
    {
      // draw nothing
    }
  }
}