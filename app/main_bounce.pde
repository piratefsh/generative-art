int width = 1000;
int height = 600;

var balls = [];
int numBalls = 60;

void setup()
{
    size(width, height);
    background(250);
    hint(ENABLE_OPENGL_4X_SMOOTH);

    int minCol = 80;
    int maxCol = 240;
    for(int i = 0; i < numBalls; i++){
        int size = Util.random(20, 40);
        color col = color(Util.random(minCol, maxCol), Util.random(minCol, maxCol), Util.random(minCol, maxCol));
        balls.push(new Ball(size, col));
    }
}

void draw(){ 
    background(255);
    balls.forEach(function(ball){
        ball.update();
        ball.draw();
    })
}
