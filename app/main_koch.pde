int width = 600;
int height = 600;

Koch k;
int levels = 0;
int edgeWidth = 400;

void setup()
{
    size(width, height);
    background(20);
    hint(ENABLE_OPENGL_4X_SMOOTH);


    frameRate(1);
    
    // noLoop();
}

void draw(){ 
    if(levels >= 4) return;
    levels++;
    k = new Koch(levels, edgeWidth)
    k.draw();
    
}