//http://processingjs.org/learning/basic/arctangent/

class Eye{
    int x, y;
    int size;
    float angle = 0.0;

    Eye(int ex, int ey, int s){
        x = ex;
        y = ey;
        size = s;
    }

    void update(int mx, my){
        angle = atan(my-y, mx-x);
    }

    void display(){
        pushMatrix();
        translate(x, y);
        fill(255);
        ellipse(0, 0, size, size);
        rotate(angle);
        fill(153);
        ellipse(size/4, 0, size/2, size/2);
        popMatrix();
    }
}