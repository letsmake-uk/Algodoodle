
void setup()
{
  fullScreen();
}

void draw()
{ 
  fill( 0, 5 );
  noStroke();
  rect( 0, 0, width, height );

    
  if( mousePressed )
  {
    float distance = dist( pmouseX, pmouseY, mouseX, mouseY );
    strokeWeight( distance );
    stroke( random(255), 100, 100 );

    line( pmouseX, pmouseY, mouseX, mouseY );
  }
  
}