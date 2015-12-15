class Intersections{
    ArrayList solarSystems;
    int ssSize;

    Intersections(numSs){
        solarSystems = new ArrayList();
        ssSize = 40;
        ssPlanets = 20;
        for(int i = 0; i < numSs; i++){
            SolarSystem ss = new SolarSystem(ssSize, ssPlanets);
            solarSystems.add(ss);
        }
    }

    void update(){

    }

    void draw(){
        background(0);
        // draw solar systems
        for(int i = 0; i < solarSystems.size(); i++){
            SolarSystem ss = solarSystems.get(i);
            ss.draw();
        }
    }
}

class SolarSystem{
    int size;
    ArrayList planets;
    PVector velocity;
    PVector pos;


    SolarSystem(size, numPlanets){
        this.pos = Util.randomPoint();
        this.size = size;
        this.planets = new ArrayList();

        this.velocity = new PVector(1, 1);

        int minPlanetSz = 1;
        int maxPlanetSz = 6;

        // create planets at random points on solar system
        for(int i = 0; i < numPlanets; i++){
            int r = Math.floor(Math.random() * (maxPlanetSz - minPlanetSz) + minPlanetSz);
            PVector pt = this.randomPoint();
            this.planets.add(new Planet(r, pt));
        }

    }

    PVector pointAt(int x, boolean sign){
        int r = this.size;
        // (y - k)**2 = r**2 - (x - h)**2

        // a = r**2 - (x - h)**2
        float a = r*r - Math.pow(x - pos.x, 2);

        // b = sqrt(a), either pos or neg
        float b = Math.floor(Math.sqrt(a));

        b = sign ? b : b * -1;

        // y = b + k
        int y = b + this.pos.y;

        PVector p = new PVector(x, y);
        return p;
    }

    PVector randomPoint(){
        int r = this.size;

        // random x
        int x = this.pos.x - r + Math.floor((Math.random() * 2 * r));

        return this.pointAt(x,  Math.random() < 0.5)
    }

    void update(){

    }

    void draw(){
        // draw ss
        ellipseMode(RADIUS);
        stroke(180, 180, 180, 100);
        fill(0, 0, 0, 0);
        ellipse(this.pos.x, this.pos.y, this.size, this.size);

        // draw planets
        for(int i = 0; i < this.planets.size(); i++){
            Planet p = this.planets.get(i);
            p.draw();
        }

    }
}

class Planet{
    int radius;
    PVector pos;
    color col;

    Planet(r, pos){
        this.radius = r;
        this.pos = Util.copyVector(pos);
        this.col = color(255, 255, 255);
    }

    void update(pos){
        // update position
        this.pos.set(pos.x, pos.y, pos.z);
    }

    void draw(){
        // draw planet
        ellipseMode(RADIUS);
        fill(this.col);
        stroke(this.col, 200);
        ellipse(this.pos.x, this.pos.y, radius, radius);
    }

}
