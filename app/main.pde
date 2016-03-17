// int width = 600;
// int height = 600;

// Koch k;

// void setup()
// {
//     size(width, height);
//     background(20);
//     hint(ENABLE_OPENGL_4X_SMOOTH);

//     int levels = 3;
//     int edgeWidth = 400;
//     k = new Koch(levels, edgeWidth)
    
//     noLoop();
// }

// void draw(){ 
//     k.draw();
    
// }

int width = 600;
int height = 600;

var balls = [];
int numBalls = 20;

void setup()
{
    size(width, height);
    background(250);
    hint(ENABLE_OPENGL_4X_SMOOTH);

    for(int i = 0; i < numBalls; i++){
        int size = Util.random(20, 50);
        color col = color(Util.random(90, 255), Util.random(90, 255), Util.random(90, 255));
        balls.push(new Ball(size, col));
    }
}

void draw(){ 
    balls.forEach(function(ball){
        ball.update();
        ball.draw();
    })
}
