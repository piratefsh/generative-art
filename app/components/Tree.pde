public class Branch{

    private static int lastId = 0;

    PVector start;
    PVector end;
    PVector velocity;
    color branchColor;
    boolean died;

    int id;

    Branch(p, v, c){
        start = p;
        end = new PVector(p.x, p.y);
        velocity = v;

        branchColor = c;
        died = false;

        id = lastId++;
    }

    void update(){
        if (!died && end.x > 0 && end.y > 0 && end.x < width && end.y < height){
            end.add(velocity);
        }
        else{
            this.die();
        }
    }

    void draw(){
        if(!died){
            stroke(branchColor);
            strokeWeight(1);
            line(start.x, start.y, end.x, end.y);
        }
    }

    void die(){
        died = true;
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
    ArrayList branches;

    Tree(){
        branches = new ArrayList();
        Branch green = new Branch(new PVector(50, 50), new PVector(1, 1), color(0, 255, 0));
        Branch blue = new Branch(new PVector(100, 50), new PVector(-1, 1), color(0, 0, 255));
        Branch purple = new Branch(new PVector(50, 150), new PVector(1, -1), color(255, 0, 255));
        Branch red = new Branch(new PVector(132, 202), new PVector(-1, -1), color(255, 0, 0));
        branches.add(green);
        branches.add(blue);
        branches.add(red);
        branches.add(purple);
    }

    void update(){
        for(int i = 0; i < branches.size(); i++){
            Branch b = (Branch) branches.get(i);

            b.update();

            // if grown into another branch, kill branch
            if(!b.died && this.collidedWith(b)){
                b.die();
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
