int width = Math.floor(window.innerWidth);
int height = Math.floor(window.innerHeight);

LSystems l;
String iteration;
void setup()
{
    size(width, height);
    background(250);
    hint(ENABLE_OPENGL_4X_SMOOTH);

    l = new LSystems('F', 10, 10);
    l.addRule('F', 'F[-F]+F');
    iteration = l.iterate(7);
    noLoop();
}

void draw(){  
    translate(400, 200, 0);
    l.draw(iteration);
}

