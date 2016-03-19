class KochTesselation{
    PVector center;
    int length; 
    int kochLevel;
    int level;
    int kochLevel;
    KochTesselation(center, length, level, kochLevel){
        this.center = center;
        this.length = length;
        this.level = level;
        this.kochLevel = kochLevel;
    }

    void draw(c){
        if(!c){
            c = color(255, 255, 255);
        }
        pushMatrix();
        translate(this.center.x, this.center.y);
        fill(0);
        // ellipse(0, 0, 5, 5);
        stroke(250, 100, 100);
        fill(250, 100, 100);

        if(this.level == 1){
            Koch kh = new Koch(this.kochLevel, this.length*1.5);
            kh.draw(c);
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
                color col = Koch.green;

                KochTesselation k = new KochTesselation(c, tl, this.level-1, this.kochLevel);
                k.draw(col);
                popMatrix();
            }
        }
        popMatrix();
    }
}