int width = Math.floor(window.innerWidth);
int height = Math.floor(window.innerHeight);
Intersections inters;

void setup()
{
  size(width, height);
  background(250);

  hint(ENABLE_OPENGL_4X_SMOOTH);
  inters = new Intersections(20);
}

void draw(){  
  inters.update();
  inters.draw();
}

