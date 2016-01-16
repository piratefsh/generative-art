GameOfLife gol;
int w = window.innerWidth;
int h = window.innerHeight;

void setup()
{
    // set size of canvas
    size(w, h);

    // set background color
    background(10);
    
    int scale = 4;
    int sizex = Math.floor(w/scale);
    int sizey = Math.floor(h/scale);

    // create instance
    gol = new GameOfLife({x: sizex, y: sizey}, scale);

    frameRate(12);
}

void draw(){  
    gol.draw();
    gol.update();
}

