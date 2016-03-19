class KochTesselation{
    PVector center;
    int length; 
    KochTesselation(center, length, level){
        this.center = center;
        this.length = length;
        this.level = level;
        this.h = Math.sqrt(Math.pow(length, 2) - Math.pow(length/2, 2));
    }

    void draw(){
        pushMatrix();
        translate(this.center.x, this.center.y);
        fill(0);
        ellipse(0, 0, 5, 5);
        stroke(250, 100, 100);
        fill(250, 100, 100);

        for(int i = 0; i < 6; i++){
            pushMatrix();
            rotate(radians(360/6*i));
            translate(this.length*1.14, 0);
            rotate(radians(30));
            Koch k = new Koch(this.level, this.length);
            k.draw();
            popMatrix();
        }
        popMatrix();
    }
}