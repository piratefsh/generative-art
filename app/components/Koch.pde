class Koch{

  // defaults
  int levels = 3;
  int edgeWidth = 400;

  // colors
  static color pink = color(255, 20, 147);
  static color green = color(154, 205, 50);
  static color red = color(300, 28, 87);
  static color yellow = color(255, 215, 0);

  Koch(levels, width){
    this.levels = levels;
    this.edgeWidth = width;
  }

  void height(){
    int c2 = Math.pow(edgeWidth, 2) + Math.pow(edgeWidth/2, 2);
    return -Math.sqrt(c2)/4;
  }
  void draw(c){
    pushMatrix();
    int levels = this.levels;
    int edgeWidth = this.edgeWidth;

    int offsetW = -edgeWidth/2;
    int offsetH = this.height();

    // start at x, y = 100, 200
    translate(offsetW, offsetH);

    // set styles
    strokeWeight(1);
    strokeJoin(ROUND);
    stroke(c, 40);

    // draw three edges in a triangle
    this.edge(edgeWidth, levels) 
    rotate(radians(120))
    this.edge(edgeWidth, levels) 
    rotate(radians(120))
    this.edge(edgeWidth, levels) 

    popMatrix();
    // save to png
    // save('koch-'+levels+'.png')
  }

  void edge(length, level){
    // segment length
    int sl = length/3;

    boolean setColor = level > 1;

    // base case, draw single _
    if(level == 0){
        // _
        line(0, 0, length, 0);
        translate(length, 0);
    }

    // recursive case, draw edge for every segment
    else {
        // _
        edge(sl, level-1);

        // _/
        rotate(radians(-60));
        edge(sl, level-1);

        // _/\
        rotate(radians(120));
        edge(sl, level-1);

        // _/\_
        rotate(radians(-60));
        edge(sl, level-1);
    }
  }

  void estimatedArea(){
    return (Math.sqrt(3) / 4) * this.edgeWidth*this.edgeWidth;
  }

  void area(){
    float h = this.height();
    int b = this.edgeWidth/2;
    int n = this.level;
    float a0 = h * b / 2;
    return a0/5 * (8 - 3 * Math.pow((4/9)), n);
  }

  void thirdLength(){
    float h = this.height();
    float a = this.area/3;
    float a0 = (5*a)/(8 - 3 * Math.pow((4/9)), n);
    float tl = 2* (a0 * 2) / h;
  }
}