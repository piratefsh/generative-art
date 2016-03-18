class Ball{
  int size;
  PVector velocity;
  PVector position;
  color fillColor;

  Ball(size, col){
    this.size = size;
    this.position = Util.randomPoint();
    this.velocity = Util.randomVelocity();
    this.fillColor = col;
  }

  void update(){
    this.position.add(this.velocity);
    if(this.position.x < this.size/2 || this.position.x > width-this.size/2){
      this.velocity.x *= -1
    }
    if(this.position.y < this.size/2 || this.position.y > height-this.size/2){
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