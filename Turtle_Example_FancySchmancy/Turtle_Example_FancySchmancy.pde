
Turtle turtle;

void setup()
{
  size( 600, 600 );
  
  turtle = new Turtle();
  turtle.setSpeed(10);
  
  for( int i=0; i< 15; i++ )
  {
    doSquare( i*10 );
  }
}

void draw()
{
  turtle.move();
}

void doSquare( int size )
{
  turtle.addInstruction("forward", size );
  turtle.addInstruction("left", 90);
  turtle.addInstruction("forward", size );
  turtle.addInstruction("left", 90);
  turtle.addInstruction("forward", size );
  turtle.addInstruction("left", 90);
  turtle.addInstruction("forward", size );
  turtle.addInstruction("left", 90);
}