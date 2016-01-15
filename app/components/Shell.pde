class Shell{
    ArrayList points;

    PVector aStart;
    PVector aEnd;
    PVector aControlStart;
    PVector aControlEnd;

    PVector bStart;
    PVector bEnd;
    PVector bControlStart;
    PVector bControlEnd;

    PVector startVelocity;
    PVector endVelocity;

    Shell(){
        this.points = new ArrayList();
        this.size = new PVector(100, 200);

        // pick random points
        int min = 100;
        aStart          = Util.randomPoint(min, width - min, min, height - min);
        aEnd            = Util.randomPoint(min, width - min, min, height - min);
        aControlStart   = Util.randomPoint(min, width - min, min, height - min);
        
        bStart          = aEnd;
        bEnd            = aStart;
        bControlStart   = Util.randomPoint(min, width - min, min, height - min);

        startVelocity = Util.randomVelocity();
        endVelocity = Util.randomVelocity();
    }

    void update(){
        this.aStart.add(this.startVelocity);
        this.aEnd.add(this.endVelocity);
        this.aControlStart.add(this.startVelocity);
        this.bControlStart.add(this.endVelocity);
        
        // make end of A and start of B curves join smoothly using midpoint technique
        // reference: http://caffeineoncode.com/2010/12/joining-multiple-bezier-curves/
        // but instead of finding midpoint, use aEnd as midpoint, and bControlStart as control point
        // and calculate aControlEnd for points that go through aEnd

        // aEnd = (aControlEnd + bControlStart) / 2
        // therefore, aControlEnd = aEnd * 2 - bControlStart
        this.aControlEnd = Util.copyVector(this.aEnd);
        this.aControlEnd.mult(2);
        this.aControlEnd.sub(this.bControlStart);

        // do same for starting of B and end of A
        this.bControlEnd = Util.copyVector(this.bEnd);
        this.bControlEnd.mult(2);
        this.bControlEnd.sub(this.aControlStart);
        this.aStart = this.bEnd;

        if(Math.random() > 0.98){
            this.startVelocity = Util.randomVelocity();
        }
        if(Math.random() > 0.99){
            this.endVelocity = Util.randomVelocity();
        }
    }

    void draw(){
        noFill();
        stroke(0, 0, 0, 5);
        bezier(this.aStart.x, this.aStart.y, this.aControlStart.x, this.aControlStart.y, this.aControlEnd.x, this.aControlEnd.y, this.aEnd.x, this.aEnd.y);
        bezier(this.bStart.x, this.bStart.y, this.bControlStart.x, this.bControlStart.y, this.bControlEnd.x, this.bControlEnd.y, this.bEnd.x, this.bEnd.y);
    }

    void debug(){
        stroke(0, 0, 0);
        fill(0,0,0);
        textFont(loadFont('Arial'), 10);
        text("start", aStart.x, aStart.y); 
        rect(aStart.x, aStart.y, 2, 2);
        text("end", aEnd.x, aEnd.y); 
        rect(aEnd.x, aEnd.y, 2, 2);
        stroke(100, 100, 100);
        text("aControlStart", aControlStart.x, aControlStart.y); 
        rect(aControlStart.x, aControlStart.y, 2, 2);
        text("aControlEnd", aControlEnd.x, aControlEnd.y); 
        rect(aControlEnd.x, aControlEnd.y, 2, 2);
        stroke(255, 0, 0);
        rect(bStart.x, bStart.y, 2, 2);
        rect(bEnd.x, bEnd.y, 2, 2);
        stroke(255, 0, 255);
        text("bControlStart", bControlStart.x, bControlStart.y); 
        rect(bControlStart.x, bControlStart.y, 2, 2);
        text("bControlEnd", bControlEnd.x, bControlEnd.y); 
        rect(bControlEnd.x, bControlEnd.y, 2, 2);
    }
}