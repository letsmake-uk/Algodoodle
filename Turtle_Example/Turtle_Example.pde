
Turtle turtle;



void setup()
{
  size( 600, 600 );
  //noLoop();
  
  turtle = new Turtle();
}


void draw()
{
  turtle.forward(10);
  turtle.left(10);
}