class KochTesselation{
    PVector center;
    int length; 
    KochTesselation(center, length, level){
        this.center = center;
        this.length = length;
        this.level = level;
        this.h = Math.sqrt(Math.pow(length, 2) - Math.pow(length/2, 2));
        console.log(length, this.level);
        // this.draw();
    }

    void draw(){
        pushMatrix();
        translate(this.center.x, this.center.y);
        fill(0);
        ellipse(0, 0, 5, 5);
        stroke(250, 100, 100);
        fill(250, 100, 100);

        if(this.level == 1){
            Koch kh = new Koch(2, this.length*1.5);
            kh.draw();
        }
        else{
            for(int i = 0; i < 6; i++){
                pushMatrix();
                rotate(radians(360/6*i));
                translate(this.length, 0);
                rotate(radians(30));
                PVector c = new PVector(0, 0);

                Koch kh = new Koch(2, this.length);
                float a = kh.estimatedArea()/3;
                float tl = Math.sqrt((4*a)/Math.sqrt(3));

                KochTesselation k = new KochTesselation(c, tl, this.level-1);
                k.draw();
                popMatrix();
            }
        }
        popMatrix();
    }
}