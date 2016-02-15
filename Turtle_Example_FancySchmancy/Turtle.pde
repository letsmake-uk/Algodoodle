
/*
 *  Simple implementation of a LOGO style turtle to draw with
 */
class Instruction
{
  public String action;
  public int value;
  Instruction(String _action, int _value)
  {
    action = _action;
    value = _value;
  }
}

class Turtle
{
  ArrayList<Instruction> instructions = new ArrayList<Instruction>(); 
  Instruction current = new Instruction("",0);
  int delayTime = 1000;  
  
  public color colour;
  public float weight;

  private boolean penDown;

  private PVector   position;
  private PVector   lastPosition;
  private float   heading;

  Turtle(  )
  {
    colour = color( 0, 100, 100 );
    weight = 2;

    position     = new PVector( width/2, height/2 );
    lastPosition = new PVector( width/2, height/2 );
    heading      = radians(-90);
    penDown      = true;
  }

  void addInstruction(String _action, int _value)
  {
    //validation of string
    instructions.add(new Instruction(_action, _value));
  }
  
  void addInstruction(String _action)
  {
    //validation of string
    instructions.add(new Instruction(_action, 0));
  }  

  void setSpeed( float newSpeed )
  {
    delayTime = (int)(1/newSpeed * 1000);
  }
  
  void move()
  {
    if(instructions.size() > 0)
    {
      current = instructions.get(0);
      instructions.remove(0);
      boolean validInstruction = true; 
      
      if(current.action == "left"){
        left(current.value);
      }
      else if (current.action == "right"){
        right(current.value);
      }
      else if (current.action == "forward") {
        forward(current.value);
      }
      else if (current.action == "penup") {
        penUp();
      }
      else if (current.action == "pendown") {
        penDown();
      }
      else {
        println("Sorry, I don't understand how to move '" + current.action + "'");
        validInstruction = false;
      }
      
      if( validInstruction )
      {
        println("Moving " + current.action + " " + current.value );
      }
    }
    else {
      println("We are done here!");
      noLoop();
    }
  }
  
  void forward( float distance )
  {
    PVector moveVec = PVector.fromAngle( heading );
    moveVec.mult( distance );
    lastPosition = position.copy();
    position.add( moveVec );

    drawMove();
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
    delay( delayTime);
    if ( penDown )
    {
      stroke( colour );
      strokeWeight( weight );
      line( lastPosition.x, lastPosition.y, position.x, position.y );
    } 
    else
    {
      // draw nothing
    }
  }
}