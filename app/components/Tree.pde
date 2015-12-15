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
    int level;

    Branch(p, v, c, w, a, l){
        maxLength = 100;
        start = p;
        velocity = v;

        prev = new PVector(p.x, p.y); 
        prev.sub(velocity)
        end = new PVector(p.x, p.y);
        strokeWidth = w;

        branchColor = c;
        branchAlpha = a;
        died = false;

        level = l;

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
        // line(start.x, start.y, end.x, end.y);
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
    static PVector velocities = [new PVector(1, 1), new PVector(1, -1), 
        new PVector(-1, 1), new PVector(-1, -1)];
    static color colors = [color(255, 100, 100), color(100, 150, 150), 
        color(150, 100, 200), color(150, 150, 50)];

    ArrayList branches;
    color bgColor;
    int numBranches;


    Tree(n){
        bgColor = color(250, 250, 250);
        numBranches = n;
        branches = new ArrayList();

        background(bgColor);
        color c = this.randomColor();

        // generate random starting branches
        for(int i = 0; i < numBranches; i++){
            PVector randStart = this.randomPoint();
            PVector randVel = this.randomVelocity();
            Branch branch = new Branch(randStart, randVel, c, 3, 30, Math.floor(numBranches/(Math.PI+1)));
            branches.add(branch);
        }
    }

    PVector randomPoint(){
        return new PVector(Math.floor(Math.random() * width), Math.floor(Math.random() * height));
    }

    PVector randomVelocity(PVector except){
        PVector rand = velocities[Math.floor(Math.random() * 10 % velocities.length)];

        while(except && rand.dist(except) == 0){
            rand = velocities[Math.floor(Math.random() * 10 % velocities.length)];
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
            if(!b.died && this.collided(b.end)){
                b.die();
                // branches.remove(i);
                PVector randPt = b.randomPoint();
                PVector randVel = this.randomVelocity(b.velocity);
                float newAlpha = b.branchAlpha < 255? b.branchAlpha + 30 : 255;

                // if(!this.collided(randPt)){
                // if(b.level > 0){

                if(b.end.dist(b.start) > 1 && b.level > 0){
                    Branch newBranch = new Branch(randPt, randVel, 
                        b.branchColor, b.strokeWidth - 0.5 || 1,
                        newAlpha, b.level - 1);
                    branches.add(newBranch);
                }
            }
        }

    }

    void collided(PVector pt){
        return pixels[pt.y * width + pt.x] != bgColor
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
        // background(bgColor);
        for(int i = 0; i < branches.size(); i++){
            Branch b = (Branch) branches.get(i);
            if(!b.died){
                b.draw();
            }
        }
    }
}
