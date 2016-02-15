
void setup()
{
  fullScreen();
}

void draw()
{ 
  fill( 0, 5 );
  rect( 0, 0, width, height );

  strokeWeight(5);
  stroke( random(255), 100, 100 );
  line( pmouseX, pmouseY, mouseX, mouseY );
}