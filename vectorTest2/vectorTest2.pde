int lines = 20;
int len = 250;

void setup(){
  colorMode(RGB, 255, 255, 255);
  PVector origin = new PVector(250,250);
  size(500, 500);
  PVector[] endPoints = new PVector[2*lines];
  strokeWeight(1);
  
  for (int i = 0; i < lines; i++){
       endPoints[i] = PVector.fromAngle(i*PI/lines - PI/2);
       endPoints[i].setMag(i*len/lines);
       endPoints[i].add(origin);
       
       //second half of the figure is the mirror:
       endPoints[i+lines] = PVector.fromAngle((i*PI/lines - PI/2));
       endPoints[i+lines].setMag(-i*len/lines);
       endPoints[i+lines].add(origin);
  }
  
  for (int i = 0; i < 2*lines; i++){
    stroke((int)(endPoints[i].x*255/(2*len)),0,(int)(255-endPoints[i].y*255/(2*len)));
    line(origin.x,origin.y,endPoints[i].x,endPoints[i].y);
  }
}

void draw(){
}