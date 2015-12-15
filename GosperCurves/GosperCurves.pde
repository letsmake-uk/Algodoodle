
/*
 *   Following the instructions at 
 *    http://courses.washington.edu/css342/fukuda/prog/prog3.html
 *   to draw gosper curves
 */
 
Turtle turtle;

float gosperSize = 20;


void setup()
{
  size( 600, 600 );
  turtle = new Turtle();

  drawGosper();
}


void draw()
{
}

void drawGosper()
{
  turtle.right(90);
  rightGosper();
  leftGosper();
  rightGosper();
  leftGosper();
}

void rightGosper( int level )
{
   // TODO : Implement recursive version
}

void leftGosper( int level )
{
  // TODO : Implement recursive version
}



void rightGosper()
{
  turtle.right( 60 );
  turtle.forward( gosperSize );
  turtle.left( 60 );
  turtle.forward( gosperSize*2 );
  turtle.left( 120 );
  turtle.forward( gosperSize );
  turtle.left( 60 );
  turtle.forward( gosperSize );
  turtle.right( 120 );
  turtle.forward( gosperSize );
  turtle.right( 60 );
  turtle.forward( gosperSize );
}

void leftGosper()
{
  turtle.forward( gosperSize );
  turtle.left( 60 );
  turtle.forward( gosperSize );
  turtle.left( 120 );
  turtle.forward( gosperSize );
  turtle.right( 60 );
  turtle.forward( gosperSize );
  turtle.right( 120 );
  turtle.forward( gosperSize*2 );
  turtle.right( 60 );
  turtle.forward( gosperSize );
  turtle.left( 60 );
}