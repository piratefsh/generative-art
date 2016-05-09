class IntersectionsAlt {
    IntersectionsAlt(n){
        this.points = [];
        this.numPoints = n;
        this.shapes = {};

        for(int i = 0; i < n; i++){
            PVector rand = Util.randomPoint(0, width, 0, height);
            PVector vel = Util.randomVelocity8();
            vel.div(4);

            this.points.push({
                id: i,
                coord: rand,
                radius: Util.random(50, Math.max(width*height/10000, 100)),
                velocity: vel,
            });
        }

        PVector vel = Util.randomVelocity8();
        vel.div(4);
        this.points.push({
            id: -1,
            coord: new PVector(mouseX, mouseY),
            radius: 150,
            velocity: vel,
        });
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

        // update mouse 
        var mouseP = this.points[this.points.length-1];
        mouseP.coord.x = mouseX;
        mouseP.coord.y = mouseY;

        this.shapes.forEach(function(s){
            s.color.alpha = s.color.alpha < s.colorMax? (s.color.alpha + s.colorVel) : s.colorMax;
        })
    }

    void draw(){
        fill(0, 50);
        rect(0, 0, width, height);

        stroke(255);
        strokeWeight(0.5);
        // if point intersect with other points, draw line
        this.points.forEach(function(p, j){
            
            stroke(255, 50);
            //ellipse(p.coord.x, p.coord.y, p.radius, p.radius);

            //draw center
            stroke(255, 200);
            ellipse(p.coord.x, p.coord.y, 1, 1);

            
            var shape;

            if(!(p.id in this.shapes)){
                this.shapes[p.id] = {
                    vertices: [],
                    verticesIds: -1,
                    color: {
                        base: 255,
                        alpha: 0,
                    },
                    colorVel: 0.5,
                    colorMax: 70,

                }

            } 

            shape = this.shapes[p.id];
            var newVertices = [];
            var newVerticesIds = 0;

            // start point
            newVertices.push(new PVector(p.coord.x, p.coord.y));
            for(int i = 0; i < this.points.length; i++){
                // if intersect
                var o = this.points[i];
                int x1 = p.coord.x;
                int x2 = o.coord.x;
                int y1 = p.coord.y;
                int y2 = o.coord.y;
                int dist = Math.sqrt(Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2));
                if(dist < Math.max(p.radius, o.radius)){
                    //line(p.coord.x, p.coord.y, o.coord.x, o.coord.y);
                    // add points
                    newVertices.push(new PVector(o.coord.x, o.coord.y));
                    newVerticesIds += o.id;
                }
            }
            // end point
            newVertices.push(new PVector(p.coord.x, p.coord.y));

            // if is new shape, reset opacity
            // if(newVerticesIds != shape.verticesIds){
            if(newVertices.length != shape.vertices.length){
                shape.color.alpha =  0;
            }
            shape.vertices = newVertices;
            shape.verticesIds = newVerticesIds;
        }.bind(this));

        // draw shapes
        for(var id in this.shapes){
            var s = this.shapes[id];
            fill(s.color.base, s.color.alpha);
            stroke(255, s.color.alpha*2);

            strokeJoin(MITER);
            // start polygon
            beginShape();
            s.vertices.forEach(function(v){
                vertex(v.x, v.y);

            });
            endShape();

        }

    }
}