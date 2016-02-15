class IntersectionsAlt {
    IntersectionsAlt(n){
        this.points = [];
        this.numPoints = n;
        this.shapes = {};
        this.width = 600;
        this.height = 600;
        this.depth = Math.min(this.width, this.height);

        for(int i = 0; i < n; i++){
            PVector rand = Util.randomPoint3D(-this.width/2, this.width/2, -this.height/2, this.height/2, -this.depth/2, this.depth/2);
            PVector vel;
            while(vel == null || vel.mag() == 0){
              vel = new PVector(Util.random(-1, 1), Util.random(-1, 1), Util.random(-1, 1));
            }
            vel.div(3);

            this.points.push({
                id: i,
                coord: rand,
                radius: Util.random(50, Math.max(this.width*this.height/4000, 100)),
                velocity: vel,
            });
        }

        PVector vel = Util.randomVelocity8();
        vel.div(4);
        this.points.push({
            id: -1,
            coord: new PVector(mouseX-this.width/2, mouseY-this.height/2, 0),
            radius: 150,
            velocity: vel,
        });

        this.startPan = new PVector(0, 0);
        this.endPan = new PVector(0, 0);
        this.isPanning = false;
        this.dragged = false;
        this.rotation = new PVector(0, 0, 0);

        this.zoom = -this.depth-200;

    }

    void update(){
        // move points
        int depth = this.depth;
        this.points.forEach(function(p){
            if (p.coord.x < -this.width/2 || p.coord.x > this.width/2){
                p.velocity.x *= -1;
            }
            if (p.coord.y < -this.height/2 || p.coord.y > this.height/2){
                p.velocity.y *= -1;
            }
            if (p.coord.z < -depth/2 || p.coord.z > depth/2){
                p.velocity.z *= -1;
            }
            p.coord.add(p.velocity);
        }.bind(this));

        // update mouse 
        var mouseP = this.points[this.points.length-1];
        mouseP.coord.x = mouseX/width * this.width - this.width/2;
        mouseP.coord.y = mouseY/height * this.height - this.height/2;

        this.shapes.forEach(function(s){
            s.color.alpha = s.color.alpha < s.colorMax? (s.color.alpha + s.colorVel) : s.colorMax;
        });
    }

    void draw(){
        // translate to viewport
        int shiftX = width/2-this.width/2;
        translate(shiftX,0, this.zoom);
        background(0);
        
        // add legend
        this.drawLegend(shiftX);

        pushMatrix();
        noFill();

        // translate to center
        translate(this.width/2, this.height/2, this.depth/2);
        PVector rot = this.getRotation();
        rotateY(this.rotation.y + rot.y);
        rotateX(this.rotation.x + rot.x);
        rotateZ(this.rotation.z + rot.z);
        //rotateX(45);

        // draw axes
        //this.drawAxes();

        // draw box of bounds
        stroke(255, 100);
        box(this.width, this.height, this.depth);

        lights();
        this.drawBodies();

        popMatrix();
    }

    void drawLegend(int shiftX){
        fill(255);
        textMode(MODEL);
        textFont(createFont("Arial", 14, true)); 
        textSize(14);
        text('Click and drag to pan', -shiftX + 20, 30, -this.zoom);
        text('Press + and - to zoom', -shiftX + 20, 50, -this.zoom);

    }

    void drawAxes(){
        stroke(255, 0, 0, 100);
        line(0, 0, 0, 0, 0, this.depth/2);
        stroke(0, 255, 0, 100);
        line(0, 0, 0, 0, this.height/2, 0);
        stroke(0, 0, 255, 100);
        line(0, 0, 0, this.width/2, 0, 0);
    }

    void drawBodies(){
        // draw spheres
        noStroke();
        fill(255, 100);
        for(int i = 0; i < this.points.length; i++){
            pushMatrix()
            var p = this.points[i];
            var r = p.radius;
            var x = p.coord.x;
            var y = p.coord.y;
            translate(x, y, p.coord.z);
            // sphere(r);
            popMatrix();
        }

        this.points.forEach(function(p, j){
            //draw center
            pushMatrix()
            fill(100);
            noStroke();
            translate(p.coord.x, p.coord.y, p.coord.z);
            int c = Math.floor(j/this.points.length*255);
            fill(200);
            sphere(2);
            popMatrix();
            
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
                    colorMax: 80,
                    colorReset: 0,

                }

            } 

            shape = this.shapes[p.id];
            var newVertices = [];
            var newVerticesIds = 0;

            // start point
            newVertices.push(Util.copyVector(p.coord));
            for(int i = 0; i < this.points.length; i++){
                // if intersect
                var o = this.points[i];
                int x1 = p.coord.x;
                int x2 = o.coord.x;
                int y1 = p.coord.y;
                int y2 = o.coord.y;
                int dist = o.coord.dist(p.coord);
                if(dist < Math.max(p.radius, o.radius)){
                    // add points
                    newVertices.push(new PVector(o.coord.x, o.coord.y, o.coord.z));
                    newVerticesIds += o.id;
                }
            }

            // if is new shape, reset opacity
            if(newVertices.length != shape.vertices.length){
                shape.color.alpha =  shape.colorReset;
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
                normal(this.width/2, this.height/2, 0);
                vertex(v.x, v.y, v.z);

            });
            endShape(CLOSE);

        }
    }

    PVector getRotation(){
        float round = 2*Math.PI;
        int z = round*Math.abs(this.endPan.z/this.depth);
        if(this.dragged){
            int x =  (round*Math.abs(this.startPan.y-this.endPan.y)/this.height);
            int y =  -(round*Math.abs(this.startPan.x-this.endPan.x)/this.width);
            return new PVector(x, y, z);
        }
        else{
            return new PVector(0, 0, z);
        }
    }

    void mousePressed(){
        this.startPan = new PVector(mouseX, mouseY);
    }

    void mouseDragged(){
        this.dragged = true;
        this.endPan = new PVector(mouseX, mouseY);
    }

    void mouseReleased(){
        PVector rot = this.getRotation();
        if(this.dragged){
            this.rotation.add(rot);
        }
        this.startPan = new PVector(0, 0);
        this.endPan = new PVector(0, 0);
        this.dragged = false;
    }

    void rotZ(int val){
        this.endPan.z += val;
        this.rotation.add(this.getRotation());
    }

    void zoomZ(int val){
        this.zoom += val;
    }
}