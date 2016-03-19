int width = 600;
int height = 600;

KochTesselation k;
int levels = 0;
int edgeWidth = 100;

void setup()
{
    size(width, height);
    hint(ENABLE_OPENGL_4X_SMOOTH);
    noLoop();
    background(255);
}

void draw(){ 
    PVector center = new PVector(300, 300);
    k = new KochTesselation(center, edgeWidth, 2)
    k.draw();
}