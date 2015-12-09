class ColorTypewriter{
    //num 'char' pixels
    int sizex, sizey; 
    
    // size of one pixel
    int pxsize; 

    // grid of chars
    color[][] grid;
    int nextx = 0;
    int nexty = 0;

    // flag for when canvas is full
    boolean full = false;

    char START_CHAR = 'a';
    char END_CHAR = 'z';
    char SPACEBAR = ' ';

    int currKey = null;
    int curKeyCode = null;


    ColorTypewriter(int x, int y, int p){
        pxsize = p;
        sizex = x;
        sizey = y;
        grid = new grid[sizex][sizey]
    }

    void update(int keyval, int code){
        currKey = keyval;
        currKeyCode = code;

        if(full){
            return;
        }

        // if is backspace, go back
        if (keyval == CODED && code == DELETE){
            this.backward();
        }   
        // else add pixel 
        else{
            // get color
            color c = this.keyvalToColor(this.currKey);
            if(c){
                grid[nextx][nexty] = c;
                this.forward();
            }

        }
    }

    void draw(){
        // clear and set styles
        background(250);
        noStroke();

        // scale to pixel size
        pushMatrix();
        scale(pxsize);
        for(int x = 0; x < sizex; x++){
            for(int y = 0; y < sizey; y++){
                color c = grid[x][y];
                if(c != null){
                    fill(c[0], c[1]);
                    rect(y, x, 1, 1);
                }
            }
        }
        popMatrix();
    }

    void backward(){
        // clear last coordinate
        nexty--;
        nextx = nexty < 0? nextx - 1 < 0 ? 0 : nextx - 1 : nextx;
        nexty = nexty < 0? sizey - 1 : nexty;
        grid[nextx][nexty] = null;
    }

    void forward(){
        // get next coordinate
        nexty++;

        if (nexty >= sizey){
            nextx++;
            nexty = 0;
        }
        full = nextx >= sizex
    }

    color keyvalToColor(int keyvalue){
        // in range of keyboard characters
        if (keyvalue >= START_CHAR && keyvalue <= END_CHAR){
            colorMode(HSB, 100, 100, 100);
            int normalizedValue = keyvalue - START_CHAR;
            float val = Math.floor(normalizedValue / (END_CHAR - START_CHAR) * 100);
            return [color(val, 100, 90), 100];
        }
        else if(keyvalue == SPACEBAR){
            return [color(0, 0, 0), 0];
        }
        return null;
    }
}