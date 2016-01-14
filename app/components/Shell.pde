class Shell{
    ArrayList points;
    Shell(){
        this.points = new ArrayList();
        this.size = new PVector(100, 200);
        PVector pt = Util.randomPoint();
        

        PVector aStart = new PVector(40, 10);
        PVector aControlStart = new PVector(20, 20);
        PVector aControlEnd = new PVector(0, 0);
        PVector aEnd = new PVector(200, 200);
        PVector bStart = aEnd;
        PVector bControlStart = new PVector(220, 100);
        PVector bControlEnd = new PVector(0, 0);
        PVector bEnd = aStart;

        // debug points
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


        // make end of A and start of B curves join smoothly
        // 1. use ending point of A as control proint for b
        // bControlStart = aEnd;

        // 2. use midpoint between the A control endpoint and B control startpoint
        // as joining point between lines

        aControlEnd = Util.copyVector(aEnd);
        aControlEnd.mult(2);
        aControlEnd.sub(bControlStart);
        stroke(0, 255, 0);
        rect(aControlEnd.x, aControlEnd.y, 2, 2);

        // // aEnd = midpoint;

        // do same for starting of B and end of A
        bControlEnd = Util.copyVector(bEnd);
        bControlEnd.mult(2);
        bControlEnd.sub(aControlStart);
        aStart = bEnd;

        stroke(255, 102, 0);

        noFill();
        stroke(0, 0, 0);
        bezier(aStart.x, aStart.y, aControlStart.x, aControlStart.y, aControlEnd.x, aControlEnd.y, aEnd.x, aEnd.y);
        stroke(255, 0, 0);
        bezier(bStart.x, bStart.y, bControlStart.x, bControlStart.y, bControlEnd.x, bControlEnd.y, bEnd.x, bEnd.y);
        

    }
}