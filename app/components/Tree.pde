public class Tree{
    ArrayList <Branch> branches;

    Tree(){
        branches.add(new Branch(new PVector(50, 50), new PVector(2, 2), new color(0, 255, 0)))
    }
}

public class Branch{

    PVector start;
    PVector end;
    PVector velocity;
    color branchColor;

    Branch(p, v, c){
        end = p;
        start = pos;
        velocity = v;

        branchColor = c
    }

    update(){
        end.add(velocity)
    }

    draw(){
        stroke(branchColor)
        line(start.x, start.y, end.x, end.y)
    }

}