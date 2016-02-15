void setup()
{
  size( 800, 800 );
}

void draw()
{
  fill( 255, 5 );
  rect( 0, 0, width, height );
  
  fill(0, 255);
  
  if( mousePressed )
  {
    line( pmouseX, pmouseY, mouseX, mouseY );
    ellipse( mouseX, mouseY, 5, 5 );
    line( width/2, height/2, mouseX, mouseY);
  }
  
}