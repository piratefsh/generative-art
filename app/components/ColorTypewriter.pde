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

    char START_CHAR = 'a';
    char END_CHAR = 'z';
    char SPACEBAR = ' ';

    int currKey = null;
    int curKeyCode = null;

    ColorTypewriter(int x, int y, int p){
        pxsize = p;
        sizex = x;
        sizey = y;
        width = x * p;
        height = y * p;
    }

    void test(){
        println('test')
    }

    void update(int keyval, int code){
        currKey = keyval;
        currKeyCode = code;
    }

    void draw(){
        if(full){
            return;
        }

        if (this.currKey == CODED){
            this.backward()
        }   
        else{
            noStroke();
            pushMatrix();
            scale(pxsize);

            // get color
            color c = this.keyvalToColor(this.currKey);
            if(c){
                fill(c[0], c[1]);
                rect(nexty, nextx, 1, 1);
                this.forward();
            }

            popMatrix();
        }
        
    }

    void backward(){
        nexty--;
        nextx = nexty < 0? nextx - 1 < 0 ? 0 : nextx - 1 : nextx;
        nexty = nexty < 0? sizey - 1 : nexty;
    }

    void forward(){
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
        // in range of keyboard characters
        if (keyvalue >= START_CHAR && keyvalue <= END_CHAR){
            colorMode(HSB, 100, 100, 100);
            int normalizedValue = keyvalue - START_CHAR;
            float val = Math.floor(normalizedValue / (END_CHAR - START_CHAR) * 100);
            return [color(val, 100, 80), 100];
        }
        else if(keyvalue == SPACEBAR){
            return [color(0, 0, 0), 0];
        }

        return null;

    }

}