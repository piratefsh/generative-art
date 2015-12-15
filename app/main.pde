import RecursiveCircles;
import Eye;

int width = window.innerWidth;
int height = window.innerHeight;
// RecursiveCircles rc;
// Eye e1, e2;
// ColorTypewriter ctw;
Tree tree;

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

  // ctw = new ColorTypewriter(26, 26, 16)
  tree = new Tree(width/4);
  PVector p = new PVector(1, 1);
}

void draw(){  
  // rc.draw()
  // e1.update(mouseX, mouseY)
  // e2.update(mouseX, mouseY)

  // e1.display()
  // e2.display()
  // background(250);
  tree.update()
  tree.draw()
}

void keyPressed(){
    // ctw.update(key, keyCode);
    // ctw.draw();
}

