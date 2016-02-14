class IntersectionsAlt {
    IntersectionsAlt(n){
        this.points = [];
        this.numPoints = n;

        for(int i = 0; i < n; i++){
            PVector rand = Util.randomPoint(0, width, 0, height);
            PVector vel = Util.randomVelocity();
            vel.div(3);

            this.points.push({
                coord: rand,
                radius: Util.random(50, 100),
                velocity: vel,
            });
        }
    }

    void update(){
        // move points
        this.points.forEach(function(p){
            p.coord.add(p.velocity);

            if (p.coord.x < 0 || p.coord.x > width){
                p.coord.x  = (p.coord.x + width) % width;
            }
            else if (p.coord.y < 0 || p.coord.y > height){
                p.coord.y  = (p.coord.y + height) % height;
            }
        });
    }

    void draw(){
        fill(0, 200);
        rect(0, 0, width, height);

        stroke(255);
        // if point intersect with other points, draw line
        this.points.forEach(function(p, j){
            fill(0,0);
            stroke(255, 50);
            //ellipse(p.coord.x, p.coord.y, p.radius, p.radius);

            //draw center
            stroke(255, 255);
            ellipse(p.coord.x, p.coord.y, 1, 1);

            for(int i = j+1; i < this.points.length; i++){
                // if intersect
                var o = this.points[i];
                int x1 = p.coord.x;
                int x2 = o.coord.x;
                int y1 = p.coord.y;
                int y2 = o.coord.y;
                int dist = Math.sqrt(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2));
                if(dist < Math.max(p.radius, o.radius)){
                    line(p.coord.x, p.coord.y, o.coord.x, o.coord.y);
                }
            }
        }.bind(this));
    }
}