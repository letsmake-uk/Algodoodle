

// Initialise Colours with a list of hex values
Colours colours = new Colours( #DD0000, #00DD00, #0000DD );

void setup()
{
  size( 800, 800 );
  frameRate(2);
  background( colours.nextColour() );
  
  // Can add colours after initialising like so
  //colours.addColour( #000000 );
  
  // Can also add multiple instances of one colour 
  // ( useful when accessing randomColour() )
  //colours.addColour( #000000, 3 );
}


void draw()
{
  // Get colour sequentially
  background( colours.nextColour() );
  
  // Get colour randomly
  //background( colours.randomColour() );
}