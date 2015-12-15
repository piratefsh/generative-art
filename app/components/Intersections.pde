class Intersections{
    ArrayList solarSystems;
    int ssSize;

    Intersections(numSs){
        solarSystems = new ArrayList();
        ssSize = 80;
        ssPlanets = 12;

        // create solar systems
        for(int i = 0; i < numSs; i++){
            SolarSystem ss = new SolarSystem(ssSize, ssPlanets);
            solarSystems.add(ss);
        }
    }

    void update(){
        for(int i = 0; i < solarSystems.size(); i++){
            SolarSystem ss = solarSystems.get(i);
            ss.update();
        }
    }

    void draw(){
        fill(0, 120);
        rect(0, 0, width, height);
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
    float rotation;

    SolarSystem(size, numPlanets){
        this.pos = Util.randomPoint();
        this.size = size;
        this.planets = new ArrayList();

        this.velocity = Util.randomVelocity();
        this.rotationVelocity = 0.001;
        this.rotation = 0;

        int minPlanetSz = 1;
        int maxPlanetSz = 3;

        // create planets at random points on solar system
        for(int i = 0; i < numPlanets; i++){
            int r = Math.floor(Math.random() * (maxPlanetSz - minPlanetSz) + minPlanetSz);
            PVector pt = this.randomPoint();
            this.planets.add(new Planet(r, pt));
        }

    }

    // get point relative to circle center
    PVector pointAt(int x, boolean sign){
        int r = this.size;
        // (y - k)**2 = r**2 - (x - h)**2

        // a = r**2 - (x - h)**2
        float a = r*r - Math.pow(x, 2);

        // b = sqrt(a), either pos or neg
        float b = Math.floor(Math.sqrt(a));

        b = sign ? b : b * -1;

        // y = b + k
        int y = b;

        PVector p = new PVector(x, y);
        return p;
    }

    PVector randomPoint(){
        int r = this.size;
        // random x
        int x = 0 - r + Math.floor((Math.random() * 2 * r));
        return this.pointAt(x,  Math.random() < 0.5)
    }

    void update(){
        this.rotation += this.rotationVelocity;
        this.pos.add(this.velocity);

        if (this.pos.x < 0 || this.pos.x > width){
            this.pos.x  = (this.pos.x + width) % width;
        }
        else if (this.pos.y < 0 || this.pos.y > height){
            this.pos.y  = (this.pos.y + height) % height;
        }

        // update planets
        for(int i = 0; i < this.planets.size(); i++){
            Planet p = this.planets.get(i);
            p.update();
        }
    }

    void draw(){
        // draw ss
        pushMatrix();
        translate(this.pos.x, this.pos.y);
        rotate(Math.PI - this.rotation);

        ellipseMode(RADIUS);
        strokeWeight(1);
        stroke(180, 180, 180, 100);
        fill(0, 0, 0, 0);
        ellipse(0, 0, this.size, this.size);

        // draw planets
        for(int i = 0; i < this.planets.size(); i++){
            Planet p = this.planets.get(i);
            rotate(0);
            rotate(p.rotation);
            p.draw();
        }

        popMatrix();

    }
}

class Planet{
    int radius;
    PVector pos;
    color col;
    float rotation;
    float rotationVelocity;
    int jitter;
    int maxRadius;
    int minRadius;

    Planet(r, pos){
        this.radius = r;
        this.rotation = 0;
        this.rotationVelocity = Math.random() * 0.005;
        this.pos = Util.copyVector(pos);
        this.col = color(255, 255, 255);

        this.jitter = r/2;
        this.maxRadius = r * 1.5;
        this.minRadius = r / 2;
    }

    void update(){
        // update position
        this.rotation += this.rotationVelocity;

        int randJitter = Math.random() * this.jitter;

        // if too small
        if(this.radius < this.minRadius){
            this.radius = this.radius + randJitter;
        }

        // if too large
        else if (this.radius > this.maxRadius){
            this.radius = this.radius - randJitter;
        }
        else{
            randJitter = Math.random() > 0.5? -1 * randJitter: randJitter;
            this.radius = this.radius + randJitter;
        }

    }

    void draw(){
        // draw planet
        pushMatrix();

        translate(this.pos.x, this.pos.y);
        ellipseMode(RADIUS);
        fill(this.col);
        stroke(this.col, 160);
        strokeWeight(this.radius/2);
        ellipse(0, 0, this.radius, this.radius);

        popMatrix();
    }

}
