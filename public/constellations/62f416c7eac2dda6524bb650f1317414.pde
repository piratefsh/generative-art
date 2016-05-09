int width = Math.floor(window.innerWidth);
int height = Math.floor(window.innerHeight);


IntersectionsAlt i;
void setup()
{
    size(width, height);
    background(250);
    hint(ENABLE_OPENGL_4X_SMOOTH);
    frameRate(60);
    i = new IntersectionsAlt(width*height/(100*100));
}

void draw(){  
    i.update();
    i.draw();
}
