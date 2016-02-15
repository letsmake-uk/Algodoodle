
Colours colours = new Colours( #796BD8, #E52764, #1EB752 );

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
    
    //stroke( colours.randomColour() );
    stroke( colours.nextColour() );

    line( pmouseX, pmouseY, mouseX, mouseY );
    
    line( width-pmouseX, pmouseY, width-mouseX, mouseY );
  }
  
}