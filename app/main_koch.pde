int width = window.innerWidth;
int height = window.innerHeight;

KochTesselation k;
int levels = 0;
int edgeWidth = 200;

void setup()
{
    size(width, height);
    hint(ENABLE_OPENGL_4X_SMOOTH);
    noLoop();
    background(20, 30, 10);
}

void draw(){ 
    PVector center = new PVector(width/2, height/2);
    int kochLevel = 2;
    int tesselLevel = 3;
    k = new KochTesselation(center, edgeWidth, tesselLevel, kochLevel);
    k.draw();
}