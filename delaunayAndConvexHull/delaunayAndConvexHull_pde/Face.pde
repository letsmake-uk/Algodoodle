class Face
{
  // The three points of the face
  PVector[] ps;
     
  // Constructor
  Face(PVector a, PVector b, PVector c)
  {
    ps = new PVector[] {a, b, c};   
    this.CClockwise();
  }
   
  // Check to see if they're in counter clockwise order, if not, adjust
  void CClockwise()
  {
    if((ps[1].x - ps[0].x) * (ps[2].y - ps[0].y) - (ps[2].x - ps[0].x) * (ps[1].y - ps[0].y) > 0)
    {
      // By swapping the 2nd and 3rd verts, we are gaurenteed to reverse the direction
      PVector t = ps[1];
      ps[1] = ps[2];
      ps[2] = t;
    }
  }
   
  void draw()
  {
    triangle(ps[0].x, ps[0].y, ps[1].x, ps[1].y, ps[2].x, ps[2].y);
  }
   
  // Code from: http://www.blackpawn.com/texts/pointinpoly/default.html
  // Check if p is inside the face
  boolean InTriangle(PVector p)
  {
    PVector v0 = PVector.sub(ps[2], ps[0]);
    PVector v1 = PVector.sub(ps[1], ps[0]);
    PVector v2 = PVector.sub(p, ps[0]);
     
    // Compute dot products
    float dot00 = PVector.dot(v0, v0);
    float dot01 = PVector.dot(v0, v1);
    float dot02 = PVector.dot(v0, v2);
    float dot11 = PVector.dot(v1, v1);
    float dot12 = PVector.dot(v1, v2);
     
    float invDenom = 1.0 / (dot00 * dot11 - dot01 * dot01);
    float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
    float v = (dot00 * dot12 - dot01 * dot02) * invDenom;
 
    // Check if point is in triangle
    return (u >= 0) && (v >= 0) && (u + v < 1);
  }
   
  // Check if p is inside the circumscribed circle
  boolean InCircle(PVector p)
  {
    float [] cir = calcCircle(ps[0], ps[1], ps[2]);
     
    if(dist(cir[0], cir[1], p.x, p.y) < cir[2]) return true;
    else return false;
  }
   
  // Very messy code :(
  // Flip the common edge between this face and f
  void flip(Face f)
  {
    // Convert both of the faces' verts to an ArrayList
    ArrayList<PVector> l1 = new ArrayList<PVector>(java.util.Arrays.asList(ps));
    ArrayList<PVector> l2 = new ArrayList<PVector>(java.util.Arrays.asList(f.ps));
     
    // Keep what is common in both
    l2.retainAll(l1);
     
    // To flip a common edge, l2 must be 2 since they should share 2 verts
    if(l2.size() != 2) return;
     
    // Find the unique verts for each face
    PVector p1 = null;
    PVector p2 = null;
     
    for(int i = 0; i < 3; ++i)
    {
      p1 = ps[i];
      if(!l2.contains(p1))
        break;
    }
    for(int i = 0; i < 3; ++i)
    {
      p2 = f.ps[i];
      if(!l2.contains(p2))
        break;
    }
     
    // Do this instead of creating new faces
    ps = new PVector[] {p1, p2, l2.get(0)};
    f.ps = new PVector[] {p1, p2, l2.get(1)};
    this.CClockwise();
    f.CClockwise();
  }
   
  // Find the adjacent face (i.e. shares 2 verts) and opposite (i.e.
  // neither of the common verts are p)
  Face getAdjacent(PVector p)
  {
    ArrayList<PVector> l1 = new ArrayList<PVector>(java.util.Arrays.asList(ps));
     
    for(int i = 0; i < faces.size(); ++i)
    {
      Face f = faces.get(i);
      if(f == this) continue;
       
      ArrayList<PVector> l2 = new ArrayList<PVector>(java.util.Arrays.asList(f.ps));
       
      l2.retainAll(l1);
       
      // Must have 2 ponits in common and those two points must not be p
      if(l2.size() == 2 && !l2.contains(p))
        return f;
    }
     
    // Does not have an adjacent and opposite face
    return null;
  }
}