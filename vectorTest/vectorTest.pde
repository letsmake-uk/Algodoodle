int xs = 10;
int ys = 10;

void setup(){
  colorMode(RGB);
  int cWidth = xs*100;
  int cHeight = ys*100;
  size(1000, 1000);
  PVector[] endPoints = new PVector[xs*ys];

  for (int i = 0; i < xs; i++){
    for (int j = 0; j < ys; j++){
      endPoints[i*xs + j] = new PVector(i,j);
    }
  }
  strokeWeight(1);
  for (int i = 0; i < endPoints.length; i++){
    stroke((int)(endPoints[i].x*255/xs), 0, (int)(endPoints[i].y*255/ys));
    line(0,0,100*endPoints[i].x, 100*endPoints[i].y);
  }
}

void draw(){
}