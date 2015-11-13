PVector currPos;
PVector prevPos;
int     turnNum = 0;


// ------------------------------------------------------
// Change these variables to affect how the program draws
// ------------------------------------------------------
int strokeWidth = 10;                           // The width of the line we draw

int vStep = 15;                                // The size of our vertical steps                                        
int dStep = 50;                                // The size of our diagonal steps

color strokeColour = color( 255, 255, 255 );   // The colour of the background
color bgColour     = color( 50, 50, 50 );      // The colour of the lines



// ------------------------------------------------------
// Setup our program   
// ------------------------------------------------------
void setup()
{
  //size( 800, 800 );                             // Set our canvas size
  fullScreen();

  smooth(20);
  background( bgColour );                         // Set our background colour
  stroke( strokeColour );                         // Set our stroke colour                                                           
  strokeWeight( strokeWidth );                    // Set our stroke width 

  currPos  = new PVector( width/2, height/2 );    // Set our current position to the middle of the canvas
  prevPos  = new PVector( width/2, height/2 );    // Set our previous position to the middle of the canvas
}



//---------------------------------------------------
// Draw method is empty as we do everything in step()
//---------------------------------------------------
void draw()
{
}



//----------------------------------------------
// Handle key presses
//---------------------------------------------
void keyPressed()
{
  if ( key == ' ' )                                // If we press 'space', do one step
  {
    step();
  }
  if ( key == 'r' )                                // If we press 'r', reset the program 
  {
    background( bgColour );
    currPos  = new PVector( width/2, height/2 );   
    prevPos  = new PVector( width/2, height/2 );
  }
  if ( key == '1' )                                // If we press '1', run 100 steps
  {
    for ( int i=0; i<100; i++ )
    {
      step();
    }
  }
}



//--------------------------------
// Do a single step of our program
//--------------------------------
void step()
{
  if ( turnNum % 2 ==0 )
  {
    moveDiagonal();
  } else
  {
    moveVertical();
  }

  line( prevPos.x, prevPos.y, currPos.x, currPos.y );  // Draw a line between our previous and current position
  prevPos = new PVector( currPos.x, currPos.y );       // Set our previous position to be out current position

  turnNum++;                                           // Add one to our turn counter
}



//-------------------------------------------
// Update our currPos by moving it vertically
//-------------------------------------------
void moveVertical()
{
  if ( (int)random(2) == 0 )  // Generate a random number (0-1) to decide which direction we take
  {
    move( "UP",   0, -vStep );
  } 
  else
  {
    move( "DOWN", 0,  vStep );
  }
}



//-------------------------------------------
// Update our currPos by moving it diagonally
//-------------------------------------------
void moveDiagonal()
{
  int randInt = (int)random(4);   // Generate a random number (0-3) to decide which direction we take
  switch( randInt )
  {
  case 0: 
    move( "UP & RIGHT",   dStep, -dStep );
    break;

  case 1: 
    move( "DOWN & LEFT", -dStep,  dStep );
    break;

  case 2: 
    move( "DOWN & RIGHT", dStep,  dStep );
    break;

  case 3: 
    move( "UP & LEFT",   -dStep, -dStep );
    break;
  }
}



//---------------------------------------
// Try to move to a given location
//---------------------------------------
void move( String direction, int xMove, int yMove  )
{
  int newX = (int)currPos.x + xMove;                                 
  int newY = (int)currPos.y + yMove;                                 

  if ( newX < 0 || newY < 0 || newX > width-1 || newY > height-1 )   // Check if out of bounds
  {
    print("OUT OF BOUNDS");
    return;
  }

  loadPixels();
  if ( pixels[ newY*width + newX ] == strokeColour )                 // Check if already drawn on
  {
    println("TARGET ALREADY DRAWN ON");
    return;
  } 
  else                                                               // If not, then do the move
  {
    println( "Moving " + direction );
    currPos.add( xMove, yMove );
  }
}