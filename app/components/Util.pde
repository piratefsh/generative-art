class Util{
    static PVector copyVector(PVector p){
        return new PVector(p.x, p.y, p.z);
    }

    static PVector randomPoint(){
        int x = Math.floor(Math.random() * width);
        int y = Math.floor(Math.random() * height);
        return new PVector(x, y);
    }
}