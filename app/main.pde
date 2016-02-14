import processing.opengl.*


IntersectionsAlt i;
void setup()
{
    int w = Math.floor(window.innerWidth);
    int h = Math.floor(window.innerHeight);
    size(w, h, P3D);
    background(50);
    frameRate(60);
    // i = new IntersectionsAlt(10);
    i = new IntersectionsAlt(width*height/(100*100)*5);
    // noLoop();
}

void draw(){  
    i.update();
    i.draw();
}
