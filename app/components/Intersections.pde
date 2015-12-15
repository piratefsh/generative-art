class Intersections{
    ArrayList solarSystems;
    int ssSize;

    Intersections(numSs){
        solarSystems = new ArrayList();
        ssSize = 80;
        ssPlanets = 18;

        // create solar systems
        for(int i = 0; i < numSs; i++){
            int randSize = Math.floor(Math.random() * (ssSize - 10)) + 10;
            SolarSystem ss = new SolarSystem(randSize, ssPlanets);
            solarSystems.add(ss);
        }
    }

    void update(){
        for(int i = 0; i < solarSystems.size(); i++){
            SolarSystem ss = solarSystems.get(i);

            ss.update();
            ArrayList collisions = new ArrayList();

            if(collisions = this.collision(ss)){
                console.log();
                // find intersection points, add mini solar system
                ss.col = color(255, 100, 100);
                int[] intersections = ss.intersections(collisions.get(0));
                PVector pos0 = intersections[0];
                PVector pos1 = intersections[1];

                // solarSystems.add(newSS)
                fill(255,0,0);
                ellipse(pos0.x, pos0.y, 5, 5);
                ellipse(pos1.x, pos1.y, 5, 5);
            }
            else{
                ss.col = color(180, 180, 180);
            }
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

    void collision(SolarSystem ss){
        ArrayList collisions = new ArrayList();
        for(int i = 0; i < solarSystems.size(); i++){
            SolarSystem s = solarSystems.get(i);
            PVector dist = ss.pos.dist(s.pos);
            if (s == ss) {
                continue;
            }

            // distance between is less than radii
            // and not the the case that one is contained in another
            if(dist < ss.size + s.size 
                && dist > Math.abs(ss.size - s.size)){
                //collision
                collisions.add(s);
            }
        }

        return collisions.size() > 0 ? collisions : false;
    }
}

class SolarSystem{
    int size;
    ArrayList planets;
    PVector velocity;
    PVector pos;
    float rotation;
    color col; 
    SolarSystem(size, numPlanets){
        this.pos = Util.randomPoint();
        this.size = size;
        this.planets = new ArrayList();

        this.velocity = Util.randomVelocity();
        this.rotationVelocity = 0.001;
        this.rotation = 0;
        this.col = color(180, 180, 180);

        int minPlanetSz = 0.5;
        int maxPlanetSz = 2;

        // create planets at random points on solar system
        for(int i = 0; i < numPlanets; i++){
            int r = Math.floor(Math.random() * (maxPlanetSz - minPlanetSz)) + minPlanetSz;
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
        // this.rotation += this.rotationVelocity;
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
        // rotate(Math.PI - this.rotation);

        ellipseMode(RADIUS);
        strokeWeight(1);
        stroke(this.col, 100);
        fill(0, 0, 0, 0);
        ellipse(0, 0, this.size, this.size);

        // draw planets
        for(int i = 0; i < this.planets.size(); i++){
            Planet p = this.planets.get(i);
            // rotate(0);
            // rotate(p.rotation);
            // p.draw();
        }

        popMatrix();

    }

    // find intersection points with other solar system
    // assume solvable
    void intersections(SolarSystem other){
        int r0 = this.size;
        int r1 = other.size;

        int x0 = this.pos.x;
        int x1 = other.pos.x;

        int y0 = this.pos.y;
        int y1 = other.pos.y;

        int dx = x1 - x0;
        int dy = y1 - y0;

        float dist = Math.sqrt(dy * dy + dx * dx);
        float a = ((r0 * r0) - (r1 * r1) + (dist * dist)) / (2.0 * dist);

        float x2 = x0 + (dy * a / dist);
        float y2 = y0 + (dx * a / dist);

        float h = Math.sqrt((r0 * r0) - (a * a));

        float rx = - dy * (h / dist);
        float ry = dx * (h / dist);

        PVector p0 = new PVector((x2 + rx), (y2 + ry));
        PVector p1 = new PVector((x2 - rx), (y2 - ry));

        int[] res = [p0, p1];

        return res;
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
        this.rotationVelocity = Math.random() * 0.003;
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
