class Ball{
  int size;
  int velocity;
  int position;
  int fillColor;

  Ball(size, col){
    this.size = size;
    this.position = Util.randomPoint();
    this.velocity = Util.randomVelocity();
    this.fillColor = col;
  }

  void update(){
    this.position.add(this.velocity);
    if(this.position.x < 0 || this.position.x > width){
      this.velocity.x *= -1
    }
    if(this.position.y < 0 || this.position.y > height){
      this.velocity.y *= -1
    }
  }

  void draw(){
    pushMatrix();
    translate(this.position.x, this.position.y);
    fill(this.fillColor);
    noStroke();
    ellipse(0, 0, size, size);
    popMatrix();
  }
}