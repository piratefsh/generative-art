public class Illusion{
    Illusion(){
        this.overlay = [];

        this.padding = {
            x: 0,
            y: 20
        }
        this.overlayVelocity = {
            x: -0.3,
            y: 0
        }

        this.makeOverlay(30);
        this.shape = this.makeShape();

    }

    void makeOverlay(int n){
        console.log(this.padding);
        int colw = width/n * 0.7;
        int padY = this.padding.y;
        for(int i = 0; i < n; i++){
            this.overlay.push({
                x: Math.floor(i * (width/n)) - colw/2,
                y: padY,
                w: colw,
                h: height - padY*2
            });
        }

    }

    void draw(){
        background(255);

        this.drawShape();
        this.drawOverlay();
    }

    void makeRectMask(cx, cy, w, h){
        // create mask
        PGraphics mask = createGraphics(width, height, P2D);
        mask.background(0);
        mask.fill(255);
        mask.noStroke();
        mask.rectMode(CENTER);
        mask.circle(cx, cy, w, h);
        return mask;
    }

    void makeCircleMask(cx, cy, w, h){
        // create mask
        PGraphics mask = createGraphics(width, height, P2D);
        mask.background(0);
        mask.fill(255);
        mask.noStroke();
        mask.ellipseMode(CENTER);
        mask.ellipse(cx, cy, w, h);
        return mask;
    }

    void drawShape(){
        image(this.shape, 0, 0);
    }
    void makeShape(){

        PGraphics shape = createGraphics(width, height, P2D);
        int levels = 5;
        int r = (height - this.padding.y*4) / levels;

        for(int i = levels; i > 0; i--){
            PGraphics mask = this.makeCircleMask(width/2, height/2, r*i, r*i);

            color col = i % 2 == 0 ? color(220, 100, 0): color(0, 150, 200);
            // color col = color(220, 100, 0);
            PGraphics lines = this.drawSpacing(1, height, col, true, i);
            PImage imgLines = lines.get();
            imgLines.mask(mask.get());
            shape.image(imgLines, 0, 0);
        }

        return shape;
    }
    
    void drawMoving(){
        this.drawSpacing(1.05, height/2, color(0, 190));

        pushMatrix();
        translate(0, height/2);
        this.drawSpacing(0.95, height/2, color(0, 160));
        popMatrix();
    }

    void update(){
        this.overlay.forEach(function(o){
            if(o.x > width){
                o.x = 0;
            }
            else if(o.x < -o.w/2){
                o.x = width- o.w/2;
            }
            else{
                o.x += this.overlayVelocity.x;
            }
        }.bind(this))
    }


    void drawSpacing(s, h, c, ret, shift){

        if(!shift){
            shift = 0;
        }
        PGraphics res = createGraphics(width, height, P2D);
        res.background(255, 1);
        res.pushMatrix();
        
        res.noStroke();
        res.rectMode(CORNER);

        var ws = width/s;
        var n = this.overlay.length; 
        var bars = n * (1+1-s); // num of bars to draw after scale
        int colw = (ws/this.overlay.length * 0.5);
        int colshift = colw*0.4;

        var shiftX = shift * (colw*0.5);

        for(int i = 0; i < bars; i++){
            var x = s*Math.floor(i * (width/n)) + shiftX;
            var y = 0;
            var w = colw;
            var h = h;

            res.fill(30);
            res.rect(x, y, w, h);
            res.fill(c);
            res.rect(x+w, y+w, colshift, h);
        }

        res.popMatrix();

        if(!ret){
            image(res, 0, 0);
        }

        return res;
    }

    void drawOverlay(){
        pushMatrix();
        fill(40, 250);
        noStroke();
        rectMode(CORNER);
        for(int i = 0; i < this.overlay.length; i++){
            var bar = this.overlay[i];
            rect(bar.x, bar.y, bar.w, bar.h);
        }
        popMatrix();
    }


}