int width = 600;
int height = 600;

Koch k;

void setup()
{
    size(width, height);
    background(20);
    hint(ENABLE_OPENGL_4X_SMOOTH);

    int levels = 3;
    int edgeWidth = 400;
    k = new Koch(levels, edgeWidth)
    
    noLoop();
}

void draw(){ 
    k.draw();
    
}