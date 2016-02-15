
void setup()
{
  fullScreen();
}

void draw()
{ 
   fill( random(255), 100, 100 );
   ellipse( mouseX, mouseY, random(10, 100), random(10, 100) );
}