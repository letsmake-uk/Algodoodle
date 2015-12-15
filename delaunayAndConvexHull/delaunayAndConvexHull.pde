
/*
 *  Modified version of an Openprocessing sketch by Justin Dailey
 *
 *  http://www.openprocessing.org/sketch/62502
 *  http://justindailey.blogspot.co.uk/2012/05/delaunay-triangulation-convex-hull.html
 */

import java.util.Arrays;

ArrayList<PVector> points   = new ArrayList<PVector>();
ArrayList<Face>    faces    = new ArrayList<Face>();
ArrayList<PVector> convHull = new ArrayList<PVector>();


//---------------
// Setup function
//---------------
void setup()
{
  fullScreen();
  smooth();

  // These are three hidden points to start with, referenced as the 'omega face'
  // No real magic here, just make sure its big enough to cover the screen
  points.add( new PVector( width / 2, -5000 ) );
  points.add( new PVector( -5000, height ) );
  points.add( new PVector( width + 5000, height ) );

  // Add 3 points for the first face
  for ( int i = 0; i < 3; ++i )
    points.add( new PVector( random(width*.25, width*.75), random(height*.25, height*.75) ) );
}



//---------------
// Main draw loop
//---------------
void draw()
{
  if ( pointInsideHull( mouseX, mouseY ) )
    background( 0 );
  else
    background( 100 );

  // Go go gadget magic!
  Delaunay();

  drawTriangulation();
  drawConvexHull();

  // Draw the points
  fill( 0 ) ;
  stroke( 0 );
  for ( int i = 0; i < points.size(); ++i )
    ellipse( points.get(i).x, points.get(i).y, 5, 5 );
}



//----------------------------------------------------------------------------
// Convenience method for checking whether a given point is inside convex hull
//----------------------------------------------------------------------------
boolean pointInsideHull( float pointX, float pointY )
{
  ArrayList<PVector> l1 = new ArrayList<PVector>(points.subList(0, 3));

  PVector point = new PVector( pointX, pointY ); 
  Face    face  = null;

  for ( int j = 0; j < faces.size(); ++j )
  {
    face = faces.get( j );
    ArrayList<PVector> l2 = new ArrayList<PVector>( Arrays.asList( face.ps ) );
    l2.retainAll( l1 );

    // Skip faces that have a point in the omega face
    if ( l2.size() == 0 )
    {
      if ( face.InTriangle( point ) )
      {  
        return true;
      }
    }
  }
  return false;
}


//----------------
// Helper function
//----------------
void ValidEdge( Face f, PVector p )
{
  Face fadj = f.getAdjacent(p);

  if (fadj == null) return;

  // If it is inside the circle, it is illegal
  if (fadj.InCircle(p))
  {
    // So flip the adjacent edge, and re-validate the two new faces
    fadj.flip(f);
    ValidEdge(f, p);
    ValidEdge(fadj, p);
  }
}



//------------------------------------
//
//------------------------------------
void Delaunay()
{
  faces.clear();

  if (points.size() < 6) return;

  // Add the omega face to start with
  faces.add(new Face(points.get(0), points.get(1), points.get(2)));

  // Incrementally add all the points
  for (int i = 3; i < points.size(); i++)
  {
    PVector p = points.get(i);
    Face f = null;

    // Find the face that this point is inside of
    for (int j = 0; j < faces.size(); ++j)
    {
      f = faces.get(j);
      if (f.InTriangle(p))
        break;
    }

    // For now lest just pretend it is always inside the triangle
    // since technically it could be on the edge
    if (true)
    {
      // Remove the face that is getting broken up
      faces.remove(f);

      // Break this face into 3 new faces using the added
      // point as the common point between all of them
      Face f1 = new Face(p, f.ps[0], f.ps[1]);
      Face f2 = new Face(p, f.ps[1], f.ps[2]);
      Face f3 = new Face(p, f.ps[2], f.ps[0]);

      faces.add(f1);
      faces.add(f2);
      faces.add(f3);

      // Now make sure each face is valid
      ValidEdge(f1, p);
      ValidEdge(f2, p);
      ValidEdge(f3, p);
    } 
    else // on the edge
    {
    }
  }
}



//------------------------------------
//
//------------------------------------
void drawTriangulation()
{
  // Make an array list of the points in the omega face
  ArrayList<PVector> l1 = new ArrayList<PVector>(points.subList(0, 3));

  // Draw the triangulation
  pushStyle();
  stroke(0);
  fill(200);
  for (int j = 0; j < faces.size(); ++j)
  {
    Face f = faces.get(j);
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.ps));
    l2.retainAll(l1);

    // Skip faces that have a point in the omega face
    if (l2.size() == 0)
      f.draw();
  }
  popStyle();
}


void drawConvexHull()
{
  // Make an array list of the points in the omega face
  ArrayList<PVector> l1 = new ArrayList<PVector>(points.subList(0, 3));


  // Draw the convex hull
  pushStyle();
  strokeWeight(5);
  stroke(0, 180, 0);
  for (int j = 0; j < faces.size(); ++j)
  {
    Face f = faces.get(j);
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.ps));
    l2.retainAll(l1);

    // If a face shares 1 point in common with the omega face
    // then just draw the 1 edge of the face that does not contain
    // that point in common.
    if (l2.size() == 1)
    {
      PVector[] a = new PVector[2];
      int index = 0;
      for (int i = 0; i < l1.size(); ++i)
        if ( !f.ps[i].equals(l2.get(0)) )
          a[index++] = f.ps[i];
      line(a[0].x, a[0].y, a[1].x, a[1].y);
    }
  }
  popStyle();
}

// Code from Nate Wilson on openprocessing
// http://www.openprocessing.org/sketch/45489
// Returns a float array where:
//   ret[0] = X location
//   ret[1] = Y location
//   ret[2] = radius
float[] calcCircle(PVector p1, PVector p2, PVector p3)
{
  // two slopes from points
  float slope1 = (p1.y-p2.y)/(p1.x-p2.x);
  float slope2 = (p2.y-p3.y)/(p2.x-p3.x);
  float ret[] = new float[3];

  // make sure that the points aren't in a line
  if (slope1 != slope2)
  {
    // center X
    ret[0] = (slope1*slope2*(p3.y-p1.y) + slope1*(p2.x+p3.x) - slope2*(p1.x+p2.x))/(2*(slope1-slope2));
    // center Y
    ret[1] = -1/slope1*(ret[0]-(p1.x+p2.x)/2)+(p1.y+p2.y)/2;
    // radius
    ret[2] = dist(ret[0], ret[1], p2.x, p2.y);
  }

  // We will pretend it always works... :(
  return ret;
}

void mousePressed()
{
  points.add(new PVector(mouseX, mouseY));
  redraw();
}

void mouseDragged()
{
  points.get(points.size() - 1).x = mouseX;
  points.get(points.size() - 1).y = mouseY;
  redraw();
}