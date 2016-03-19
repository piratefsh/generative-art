class Ball{
    PVector pos;
    PVector velocity;
    color col;
    int radius;

    Ball(r, c){
        this.radius = r;
        this.col = c;

        this.pos = Util.randomPoint(); //new PVector(100, 100); //x, y
        this.velocity = Util.randomVelocity();//new PVector(2, 2); //x, y
        this.velocity.mult(2);
    }

    void draw(){
        fill(this.col);
        noStroke();
        ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
    }

    void update(){
        this.pos.add(this.velocity);

        if(this.pos.x < 0 || this.pos.x > width){
            this.velocity.x *= -1;
        }
        if(this.pos.y < 0 || this.pos.y > height){
            this.velocity.y *= -1;
        }
    }
}


var balls = [];

void setup() {
    size(400, 400);
    stroke(255);

    numBalls = 20;
    for(int i = 0; i < numBalls; i++){
        Ball b =  new Ball(Util.random(20, 40), color(Util.random(100, 220), Util.random(90, 220), Util.random(90, 210)));
        balls.push(b);
    }
    background(250);
}

void draw() {

    balls.forEach(function(b){
        b.update();
        b.draw();
    })
}
        

