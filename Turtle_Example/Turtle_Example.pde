
Turtle turtle;

void setup()
{
  size( 600, 600 );
  
  turtle = new Turtle();
  turtle.addInstruction("boop", 10);
  turtle.addInstruction("HerpDeeeeDerp", 100);
  turtle.addInstruction("FellOver",10000);
  turtle.addInstruction("forward", 100);
  turtle.addInstruction("left", 60);
  turtle.addInstruction("forward", 100);
  turtle.addInstruction("right",60);
  turtle.addInstruction("forward", 100);
}


void draw()
{
  turtle.move();
}