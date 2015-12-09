class ColorTypewriter{
    //num 'char' pixels
    int sizex, sizey; 
    
    // size of one pixel
    int pxsize; 

    // actual pixels 
    int width, height; 

    // grid of chars
    color[][] grid;
    int nextx = 0;
    int nexty = 0;

    // flag for when canvas is full
    boolean full = false;

    ColorTypewriter(int x, int y, int p){
        pxsize = p;
        sizex = x;
        sizey = y;
        width = x * p;
        height = y * p;

        currPixel = null;
    }

    void test(){
        println('test')
    }

    void update(int keyval){
        if(full){
            return;
        }

        currPixel = this.keyvalToColor(keyval);
        
    }

    void draw(int keyval){
        if(full){
            return;
        }

        noStroke();
        pushMatrix();
        scale(pxsize);

        fill(currPixel);
        rect(nexty, nextx, 1, 1);
        popMatrix()
        
        // get next coordinate
        nexty++;
        if (nexty >= sizey){
            nextx++;
            nexty = 0;
        }

        if (nextx >= sizex){
            full = true;
        }
    }

    color keyvalToColor(int keyvalue){
        colorMode(HSB, 100, 100, 100);
        float val = Math.floor(keyvalue / 128.0 * 100);
        return color(val, 50, 50);

    }

}