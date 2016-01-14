class Shell{
    ArrayList points;
    Shell(){
        this.points = new ArrayList();
        this.size = new PVector(100, 200);

        PVector aStart = Util.randomPoint();
        PVector aControlStart = Util.randomPoint();
        PVector aControlEnd = new PVector(0, 0);
        PVector aEnd = Util.randomPoint();
        PVector bStart = aEnd;
        PVector bControlStart = Util.randomPoint();
        PVector bControlEnd = new PVector(0, 0);
        PVector bEnd = aStart;

        // make end of A and start of B curves join smoothly
        aControlEnd = Util.copyVector(aEnd);
        aControlEnd.mult(2);
        aControlEnd.sub(bControlStart);

        // do same for starting of B and end of A
        bControlEnd = Util.copyVector(bEnd);
        bControlEnd.mult(2);
        bControlEnd.sub(aControlStart);
        aStart = bEnd;

        noFill();
        stroke(0, 0, 0);
        bezier(aStart.x, aStart.y, aControlStart.x, aControlStart.y, aControlEnd.x, aControlEnd.y, aEnd.x, aEnd.y);
        bezier(bStart.x, bStart.y, bControlStart.x, bControlStart.y, bControlEnd.x, bControlEnd.y, bEnd.x, bEnd.y);
        

    }
}