GameOfLife gol;

void setup()
{
    size(window.innerWidth, window.innerHeight);
    background(10);
    
    int scale = 8;
    int sizex = Math.floor(window.innerWidth/scale);
    int sizey = Math.floor(window.innerHeight/scale);
    gol = new GameOfLife({x: sizex, y: sizey}, scale);

    frameRate(8);
}

void draw(){  
    gol.draw();
    gol.update();
}

