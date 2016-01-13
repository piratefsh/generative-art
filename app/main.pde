int width = Math.floor(window.innerWidth);
int height = Math.floor(window.innerHeight);
Shell shell;

void setup()
{
  size(width, height);
  background(250);

  hint(ENABLE_OPENGL_4X_SMOOTH);
  shell = new Shell();
}

void draw(){  
  shell.update();
  shell.draw();
}

