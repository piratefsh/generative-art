class Intersections{
    ArrayList solarSystems;
    int ssSize;

    Intersections(numSs){
        solarSystems = new ArrayList();
        ssSize = 20;
        ssPlanets = 20;
        for(int i = 0; i < numSs; i++){
            SolarSystem ss = new SolarSystem(ssSize, ssPlanets);
            solarSystems.add(ss);
        }
    }

    void update(){

    }

    void draw(){
        for(int i = 0; i < solarSystems.size(); i++){
            SolarSystem ss = solarSystems.get(i);
            ss.draw();
        }
    }
}

class SolarSystem{
    int size;
    ArrayList planets;

    SolarSystem(size, numPlanets){
        this.size = size;
        this.planets = new ArrayList();
        for(int i = 0; i < numPlanets; i++){
            int r = Math.floor(Math.random() * 10 % 10);
            PVector pt = Util.randomPoint();
            this.planets.add(new Planet(r, pt));
        }

    }

    void update(){

    }

    void draw(){
        for(int i = 0; i < this.planets.size(); i++){
            Planet p = this.planets.get(i);
            p.draw();
        }

    }
}

class Planet{
    int radius;
    PVector pos;

    Planet(r, pos){
        this.radius = r;
        this.pos = Util.copyVector(pos);
    }

    void update(){

    }

    void draw(){
        ellipseMode(RADIUS);
        fill(200);
        noStroke()
        ellipse(pos.x, pos.y, radius, radius);
    }

}
