int width = 1024;
int height = 800;

KochTesselation k;
int levels = 0;
int edgeWidth = 200;

void setup()
{
    size(width, height);
    hint(ENABLE_OPENGL_4X_SMOOTH);
    noLoop();
    background(255);
}

void draw(){ 
    PVector center = new PVector(width/2, height/2);
    k = new KochTesselation(center, edgeWidth, 4)
    k.draw();
}