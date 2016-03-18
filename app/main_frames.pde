// please see Util.pde for helper function code

int width = 800;
int height = 500;

Ball ball;
int ballSize = 100;
int frames = 5;

void setup()
{
    size(width, height);
    hint(ENABLE_OPENGL_4X_SMOOTH);

    ball = new Ball(ballSize, color(255,255,255));
    ball.velocity = new PVector(130, 0);
    ball.position = new PVector(ballSize/2, height/2);

}

void draw(){ 
    while(frames > 0){
        background(200, 0);
        ball.update();
        ball.draw();
        frames--; 
        saveFrame();       
    }

}
