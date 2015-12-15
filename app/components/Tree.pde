public class Branch{

    private static int lastId = 0;

    PVector start;
    PVector end;
    PVector prev;
    PVector velocity;
    color branchColor;
    float branchAlpha;
    boolean died;
    int strokeWidth;
    int id;
    int maxLength;

    Branch(p, v, c, w, a){
        maxLength = 100;
        start = p;
        prev = new PVector(p.x, p.y); 
        end = new PVector(p.x, p.y);
        velocity = v;
        strokeWidth = w;

        branchColor = c;
        branchAlpha = a;
        died = false;

        id = lastId++;
    }

    void update(){
        if (!died && end.x > 0 && end.y > 0 
                && end.x < width && end.y < height
                && Math.abs(end.x - start.x) < maxLength){
            prev.set(end.x, end.y);
            end.add(velocity);
        }
        else{
            this.die();
        }
    }

    void draw(){
        stroke(branchColor, branchAlpha);
        strokeWeight(strokeWidth);
        strokeCap(SQUARE);
        line(prev.x, prev.y, end.x, end.y);
    }

    void die(){
        died = true;
    }

    PVector randomPoint(){
        // return midpoint for now

        int range = Math.abs(start.x - end.x);

        PVector random = new PVector(start.x, start.y);
        random.x = Math.floor(random.x + velocity.x * (Math.random() * range));
        random.y = Math.floor(random.y + velocity.y * (Math.random() * range));
        return random
    }

    void hasPoint(PVector point){
        // if not within range, return false
        if(Math.min(start.x, end.x) > point.x || point.x > Math.max(start.x, end.x)){
            return false;
        }

        float m = (end.y - start.y) / (end.x - start.x);
        float c = (1 / m) * ((0 - start.y) + (m * start.x));

        boolean res = (point.y == m * point.x + c);

        return res;
    }

    void equals(Branch b){
        return id == b.id;
    }

}

public class Tree{
    static PVector velocities = [new PVector(1, 1), new PVector(1, -1), new PVector(-1, 1), new PVector(-1, -1)];
    static color colors = [color(255, 100, 100), color(100, 150, 150), color(150, 100, 200), color(150, 150, 50)];
    ArrayList branches;
    int numBranches;
    color bgColor;


    Tree(n){
        bgColor = color(250, 250, 250);
        background(bgColor);
        numBranches = n;
        branches = new ArrayList();
        color c = this.randomColor();

        // generate random starting branches
        for(int i = 0; i < numBranches; i++){
            PVector randStart = this.randomPoint();
            PVector randVel = this.randomVelocity();
            Branch branch = new Branch(randStart, randVel, c, 3, 30);
            branches.add(branch);
        }
    }

    PVector randomPoint(){
        return new PVector(Math.floor(Math.random() * width), Math.floor(Math.random() * height));
    }

    PVector randomVelocity(PVector except){
        PVector rand = velocities[Math.floor(Math.random() * velocities.length)];

        while(except && rand.dist(except) == 0){
            rand = velocities[Math.floor(Math.random() * velocities.length)];
        }
        return rand;
    }

    color randomColor(){
        return colors[Math.floor(Math.random() * colors.length)];
    }

    void update(){
        loadPixels();
        for(int i = 0; i < branches.size(); i++){
            Branch b = (Branch) branches.get(i);

            b.update();

            // if grown into another branch, kill branch
            // and spawn new one on random point parallel to old branch
            if(!b.died && pixels[b.end.y * width + b.end.x] != bgColor){
                b.die();
                branches.remove(i);

                float newAlpha = b.branchAlpha < 255? b.branchAlpha + 30 : 255;

                if(branches.size() < 100){
                    Branch newBranch = new Branch(b.randomPoint(), this.randomVelocity(b.velocity), 
                        b.branchColor, b.strokeWidth - 0.5 || 1,
                        newAlpha);
                    branches.add(newBranch);
                }
            }
        }

    }

    void collidedWith(branch){

        for(int i = 0; i < branches.size(); i++){
            Branch b = (Branch) branches.get(i);

            // skip comparing with itself
            if(b.equals(branch)){
                continue;
            }

            if(b.hasPoint(branch.end)){
                return true;
            }
        }
        return false;
    }

    void draw(){
        for(int i = 0; i < branches.size(); i++){
            Branch b = (Branch) branches.get(i);
            b.draw();
        }
    }
}
