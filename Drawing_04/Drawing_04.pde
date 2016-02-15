
void setup()
{
  fullScreen();
}

void draw()
{ 
  fill( 0, 5 );
  rect( 0, 0, width, height );

  fill( random(255), 100, 100 );
  ellipse( mouseX, mouseY, random(10, 100), random(10, 100) );
}