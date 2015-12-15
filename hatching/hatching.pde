ArrayList<PVector> nodeList = new ArrayList<PVector>();
IntList startNodes = new IntList();

class Edge
{
  PVector[] nodes;
  // Constructor
  Edge(PVector a, PVector b)
  {
    nodes = new PVector[] {a, b};
  }
}

ArrayList<Edge> EdgeList = new ArrayList<Edge>();

int N = 4; //No. of players

void setup()
{
  size(400,400);
  smooth();
  for(int i = 0; i < N; i++){
    nodeList.add(new PVector(random(width*.25, width*.75), random(height*.25, height*.75)));
    //startNodes.append(i);
  }
  noLoop();
  background(120);
  fill(0);
  //Starting nodes
  for(int i = 0; i < nodeList.size(); i++)
  {
    ellipse(nodeList.get(i).x, nodeList.get(i).y, 3, 3);  
    //println(startNodes.get(i));
  }
}

void draw()
{
    
}