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
    PVector control1Velocity;
    PVector control2Velocity;
    PVector startTargetVelocity;
    PVector endTargetVelocity;
    PVector acceleration;

    Shell(){
        this.points = new ArrayList();
        this.size = new PVector(100, 200);

        // pick random points
        int min = 150;
        aStart          = Util.randomPoint(min, width - min, min, height - min);
        aEnd            = Util.randomPoint(min, width - min, min, height - min);
        aControlStart   = Util.randomPoint(min, width - min, min, height - min);
        
        bStart          = aEnd;
        bEnd            = aStart;
        bControlStart   = Util.randomPoint(min, width - min, min, height - min);

        startVelocity = Util.randomVelocity8();
        control1Velocity = Util.randomVelocity8();
        endVelocity = Util.randomVelocity8();
        control2Velocity = Util.randomVelocity8();

        startTargetVelocity = startVelocity;
        endTargetVelocity = endVelocity;

        acceleration = Util.randomVelocity8();
        acceleration.div(10);
    }

    void update(){
        this.aStart.add(this.startVelocity);
        this.aEnd.add(this.endVelocity);
        this.aControlStart.add(this.control1Velocity);
        this.bControlStart.add(this.control2Velocity);
        
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

        this.accelerate(this.startVelocity, this.startTargetVelocity, this.acceleration, 1);
        this.accelerate(this.endVelocity, this.endTargetVelocity, this.acceleration, 1);
        // change direction randomly
        if(Math.random() > 0.96){
            this.startTargetVelocity = Util.randomVelocity8();
        }
        if(Math.random() > 0.96){
            this.endTargetVelocity = Util.randomVelocity8();
        }
    }

    void accelerate(velocity, target, acceleration, limit){
        // update velocity
        PVector startChange = Util.copyVector(target);
        // console.log(startChange, this.acceleration);
        startChange.x *= acceleration.x;
        startChange.y *= acceleration.y;

        velocity.add(startChange);
        velocity.limit(2);
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