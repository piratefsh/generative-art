class KochTesselation{
    PVector center;
    int length; 
    int kochLevel;
    int level;
    int kochLevel;
    color col;
    KochTesselation(center, length, level, kochLevel, col){
        this.center = center;
        this.length = length;
        this.level = level;
        this.kochLevel = kochLevel;
        this.col = col;
    }

    void draw(){
        pushMatrix();
        // ellipse(0, 0, 5, 5);
        stroke(250, 100, 100);
        noFill();
        translate(this.center.x, this.center.y);

        if(this.level == 1){
            Koch kh = new Koch(this.kochLevel, this.length*Math.sqrt(2));
            kh.draw(this.col);
        }
        else{
            for(int i = 0; i < 6; i++){
                pushMatrix();
                rotate(radians(360/6*i));
                translate(this.length, 0);
                rotate(radians(30));

                Koch kh = new Koch(this.kochLevel, this.length);
                float a = kh.estimatedArea()/3;
                float tl = Math.sqrt((4*a)/Math.sqrt(3));

                PVector c = new PVector(0, 0);
                KochTesselation k = new KochTesselation(c, tl, this.level-1, this.kochLevel, this.col);
                k.draw();
                popMatrix();
            }
        }
        popMatrix();
    }
}