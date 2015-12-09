import RecursiveCircles;
import Eye;

int width = 400;
int height = 400;
RecursiveCircles rc;
Eye e1, e2;
ColorTypewriter ctw;

void setup()
{
  size(width, height);
  background(250);
  // noStroke();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  

  // rc = new RecursiveCircles(width/2, height/2, width, 7)

  // e1 = new Eye(50, 130, 40)
  // e2 = new Eye(70, 80, 60)

  ctw = new ColorTypewriter(25, 25, 16)
}

void draw(){  
  // rc.draw()
  // e1.update(mouseX, mouseY)
  // e2.update(mouseX, mouseY)

  // e1.display()
  // e2.display()
}

void keyPressed(){
    println('key', key, CODED)
    ctw.update(key, keyCode);
    ctw.draw();
}

