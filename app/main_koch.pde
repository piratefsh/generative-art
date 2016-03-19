int width = window.innerHeight;
int height = window.innerHeight;

KochTesselation k;
int levels = 0;
int edgeWidth = 160;

void setup()
{
    size(width, height);
    hint(ENABLE_OPENGL_4X_SMOOTH);
    noLoop();
    background(10, 30, 10);
}

void draw(){ 
    PVector center = new PVector(width/2, height/2);
    int kochLevel = 2;
    int tesselLevel = 5;
    k = new KochTesselation(center, edgeWidth, tesselLevel, kochLevel, Koch.green);
    k.draw();
    // save();
}