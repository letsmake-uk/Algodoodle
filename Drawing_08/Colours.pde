
/*
 *  Helper class for storing colour palletes
 */

public class Colours
{
  private ArrayList<Integer> colours;
  private int colourIndex;
  
  
  //-------------------------------------------
  // Initialise as empty
  Colours()
  {
    colours     = new ArrayList<Integer>();
    colourIndex = 0;
  }
  
  
  //-------------------------------------------
  // Initialise with an arbitrary number of colours
  Colours( int... initialColours )
  {
    colours     = new ArrayList<Integer>();
    colourIndex = 0;
    
    for(int i=0; i<initialColours.length; ++i) 
      addColour(initialColours[i]);
  }
  
  //-------------------------------------------
  public void addColour( color c )
  {
    addColour( c, 1 );
  }
  
  
  //-------------------------------------------
  // Add multiple instances of one colour
  // useful when accessing via randomColour()
  public void addColour( color c, int count )
  {
    for( int i=0; i<count; i++ )
    {
      colours.add( c );
    }
  }
  
  
  //-------------------------------------------
  public void printColours()
  {
    print( colours );
  }
  
  
  //-------------------------------------------
  public color getColour()
  {
    return( (color)colours.get( colourIndex ) );
  }
  
  
  //-------------------------------------------
  public color nextColour()
  {
    colourIndex = (colourIndex+1)%colours.size();
    return( (color)colours.get( colourIndex ) );
  }
  
  
  //-------------------------------------------
  // Return a random item from our ArrayList
  // (could maybe be useful to also have a wrapper that generates a random 
  // colour rather than returning a random colour from our collection?)
  public color randomColour()
  {
    return( (color)colours.get( (int)random( colours.size() ) ) );
  }
  
}