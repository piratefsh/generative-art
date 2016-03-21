class Ball{
    PVector pos; //x, y
    PVector velocity; //x, y
    color col;
    int radius;

    Ball(r, c){
        this.radius = r;
        this.col = c;
        this.pos = Util.randomPoint();
        this.velocity =  Util.randomVelocity();
        this.velocity.mult(2);
    }

    void draw(){
        noStroke();
        fill(this.col);
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
int numBalls = 20;

void setup() {
    size(400, 400);
    stroke(255);

    for(int i = 0; i < numBalls; i++){
        Ball b = new Ball(Util.random(30,50), color(Util.random(90,220), Util.random(90,220), Util.random(90,220)));
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