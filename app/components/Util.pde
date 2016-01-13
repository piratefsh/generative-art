class Util{
    static PVector velocities = [
        new PVector(1, 1), 
        new PVector(1, -1), 
        new PVector(-1, 1), 
        new PVector(-1, -1)];
    
    static PVector copyVector(PVector p){
        return new PVector(p.x, p.y, p.z);
    }

    static PVector randomPoint(min, max){
        int x = Math.floor(Math.random() * width);
        int y = Math.floor(Math.random() * height);
        return new PVector(x, y);
    }

    static PVector randomVelocity(){
        int i = Math.floor(Math.random() * 10 % velocities.length);
        PVector v = Util.copyVector(Util.velocities[i]);
        return v;
    }

    static float random(float min, float max, boolean floor){
        float n = Math.random() * (max - min) + min;
        return floor ? Math.floor(n) : n;
    }
}