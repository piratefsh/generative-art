int width = Math.floor(window.innerWidth);
int height = Math.floor(window.innerHeight);
Intersections inters;

void setup()
{
  size(width, height);
  background(250);
  inters = new Intersections(10);
  frameRate(45);
}

void draw(){  
  inters.update();
  inters.draw();
}

