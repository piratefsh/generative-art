public class Illusion{
    Illusion(){
        this.overlay = [];

        this.makeOverlay(50);
        this.overlayVelocity = {
            x: 0.6,
            y: 0
        }

        this.shape = this.makeShape();
    }

    void makeOverlay(int n){
        int colw = width/n * 0.7;
        for(int i = 0; i < n; i++){
            this.overlay.push({
                x: Math.floor(i * (width/n)) - colw/2,
                y: 10,
                w: colw,
                h: height-20
            });
        }

    }

    void draw(){
        background(255);

        this.drawShape();

        pushMatrix();
        this.drawOverlay();
        popMatrix();
    }

    void makeRectMask(cx, cy, w, h){
        // create mask
        PGraphics mask = createGraphics(width, height, P2D);
        mask.background(0);
        mask.fill(255);
        mask.noStroke();
        mask.rectMode(CENTER);
        mask.rect(cx, cy, w, h);
        return mask;
    }

    void drawShape(){
        image(this.shape, 0, 0);
    }
    void makeShape(){

        PGraphics shape = createGraphics(width, height, P2D);

        for(int i = 6; i > 0; i--){
            PGraphics mask = this.makeRectMask(width/2, height/2, 50*i, 50*i);
            PGraphics lines = this.drawSpacing(1, height, color(255, 1), true, i);
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
            if(o.x < width){
                o.x += this.overlayVelocity.x;
            }
            else{
                o.x = 0;
            }
        }.bind(this))
    }


    void drawSpacing(s, h, c, ret, shift){

        if(!shift){
            shift = 0;
        }
        PGraphics res = createGraphics(width, height, P2D);

        res.pushMatrix();
        res.fill(c);
        res.noStroke();
        res.rectMode(CORNER);

        var ws = width/s;
        var n = this.overlay.length; 
        var bars = n * (1+1-s); // num of bars to draw after scale
        int colw = (ws/this.overlay.length * 0.5);

        var shiftX = shift * (colw*0.5);

        for(int i = 0; i < bars; i++){
            var x = s*Math.floor(i * (width/n)) + shiftX;
            var y = 0;
            var w = colw;
            var h = h;


            res.rect(x, y, w, h);
            
        }
        res.popMatrix();

        if(!ret){
            image(res, 0, 0);
        }

        return res;
    }

    void drawOverlay(){
        pushMatrix();
        fill(0);
        noStroke();
        rectMode(CORNER);
        for(int i = 0; i < this.overlay.length; i++){
            var bar = this.overlay[i];
            rect(bar.x, bar.y, bar.w, bar.h);
        }
        popMatrix();
    }


}