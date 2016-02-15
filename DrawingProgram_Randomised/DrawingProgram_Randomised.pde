

void setup()
{
 size(1920 ,1080);
}

void draw()
{
  fill(0, 5);
  rect( 0, 0, width, height );
  
  float myRandomNumber = random(255);
  
  fill( myRandomNumber, 255-myRandomNumber, myRandomNumber );
  ellipse( mouseX, mouseY, myRandomNumber/3, myRandomNumber/3 );
}