class Util{
    static PVector velocities = [
        new PVector(1, 1), 
        new PVector(1, -1), 
        new PVector(-1, 1), 
        new PVector(-1, -1)];

    static PVector velocities8 = [
        new PVector(1, 1), 
        new PVector(1, -1), 
        new PVector(-1, 1), 
        new PVector(-1, -1),
        new PVector(1, 0),
        new PVector(0, 1),
        new PVector(-1, 0),
        new PVector(0, -1)
    ];
    
    static PVector copyVector(PVector p){
        return new PVector(p.x, p.y, p.z);
    }

    static PVector randomPoint(minw, maxw, minh, maxh){
        minw = minw || 0;
        minh = minh || 0;
        maxw = maxw || width;
        maxh = maxh || height;
        int x = Util.random(minw, maxw, true);
        int y = Util.random(minh, maxh, true);
        return new PVector(x, y);
    }

    static PVector randomVelocity(){
        int i = Math.floor(Math.random() * 10 % velocities.length);
        PVector v = Util.copyVector(Util.velocities[i]);
        return v;
    }

    static PVector randomVelocity8(){
        int i = Math.floor(Math.random() * 10 % velocities8.length);
        PVector v = Util.copyVector(Util.velocities8[i]);
        return v;
    }

    static float random(float min, float max, boolean floor){
        float n = Math.random() * (max - min) + min;
        return floor ? Math.floor(n) : n;
    }
}