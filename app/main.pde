class Ball{
    PVector pos; //x, y
    PVector velocity; //x, y
    color col;
    int radius;

    Ball(r, c){
        this.pos = Util.randomPoint();
        this.velocity = Util.randomVelocity();
        this.velocity.mult(2);
        this.radius = r;
        this.col = c;
    }

    void draw(){
        fill(this.col);
        noStroke();
        ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
    }

    void update(){

        if(this.pos.x < 0 || this.pos.x > width){
            this.velocity.x *= -1;
        }
        if(this.pos.y < 0 || this.pos.y > height){
            this.velocity.y *= -1;
        }
        this.pos.add(this.velocity);
    }
}



var balls = [];
int numBalls = 30;

void setup() {
    size(400, 400);
    stroke(255);

    for(int i = 0; i < numBalls; i++){
        Ball b = new Ball(Util.random(20,40), color(Util.random(90, 200), Util.random(90, 200), Util.random(90, 200)));
        balls.push(b);
    }
}

void draw() {
    // background(250);

    balls.forEach(function(b){
        b.update();
        b.draw();
    })
}