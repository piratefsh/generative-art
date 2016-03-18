class Ball{
    PVector position; // x, y
    PVector velocity; // x, y
    int size;
    color col;

    Ball(size, col) {
        this.position = Util.randomPoint(); //new PVector(100, 100);
        this.velocity = Util.randomVelocity8();//new PVector(2, 2);
        this.size = size;
        this.col = col;
    }

    void draw(){
        fill(this.col);
        noStroke();
        ellipse(this.position.x, this.position.y, this.size, this.size);
    }

    void update(){
        if(this.position.x < 0 || this.position.x > width){
            this.velocity.x *= -1
        }
        if(this.position.y < 0 || this.position.y > height){
            this.velocity.y *= -1;
        }

        this.position.add(this.velocity);
    }
}


var balls = [];
int numBalls = 20;
int minCol = 100;
int maxCol = 230;

void setup() {
    background(255);
    size(600, 600);
    stroke(255);

    for(int i = 0; i < numBalls; i++){
        color c =  color(Util.random(minCol, maxCol), Util.random(minCol, maxCol), Util.random(minCol, maxCol))
        balls.push(new Ball(Util.random(30, 40), c));
    }
}

void draw() {

    balls.forEach(function(b){
        b.update();
        b.draw();
    })
}


