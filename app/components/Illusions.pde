public class Illusion{
    Illusion(){
        this.overlay = [];

        this.makeOverlay(24);
        this.overlayVelocity = {
            x: 0.8,
            y: 0
        }
    }

    void makeOverlay(int n){
        int colw = width/n * 0.7;
        for(int i = 0; i < n; i++){
            this.overlay.push({
                x: Math.floor(i * (width/n)),
                y: 0,
                w: colw,
                h: height/2
            });
        }

    }

    void draw(){
        background(255);
        this.spacing(1.05, color(0, 190));

        pushMatrix();
        translate(0, height/2);
        this.spacing(0.95, color(0, 160));
        popMatrix();

        pushMatrix();
        translate(0, height/4);
        this.drawOverlay();
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

    void spacing(s, c){
        pushMatrix();
        fill(c);
        noStroke();
        rectMode(CORNER);
        var ws = width/s;
        var n = this.overlay.length; 
        var bars = n * (1+1-s); // num of bars to draw after scale
        int colw = (ws/this.overlay.length * 0.5);
        for(int i = 0; i < bars; i++){
            var x = s*Math.floor(i * (width/n));
            var y = 0;
            var w = colw;
            var h = height/2;
            rect(x, y, w, h);
            
        }
        popMatrix();
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