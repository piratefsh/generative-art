class GameOfLife{
    GameOfLife(size, scale){
        // initialize variables
        this.grid = {};
        this.size = size;
        this.scale = scale;

        // generate grid as coordinate map
        // { [0,0] : true, [0, 1]: false ... [n, n]: true }
        for(int x = 0; x < size.x; x++){
            for(int y = 0; y < size.y; y++){
                // checkerboard pattern
                boolean occupied = (x + y) % 2 == 1;
                this.grid[[x,y]] = occupied;
            }
        }

        // draw initial state
        this.draw();
    }

    // update next state of grid
    void update(){
        // create new grid
        var newGrid = {};

        // update live status of each cell
        for(int x = 0; x < this.size.x; x++){
            for(int y = 0; y < this.size.y; y++){
                // get number of neighbours
                int n = this.neighbours(x, y);

                // set new state of cell
                newGrid[[x, y]] = this.deadOrAlive(x, y, n);
            }
        }
        this.grid = newGrid;
    }
    
    // returns whether cell at x, y should be alive or dead
    void deadOrAlive(x, y, n){
        boolean alive = this.grid[[x, y]];
        // if is currently live cell
        if (alive){
            // if has < 2 live neighbours, die
            if (n < 2) return false;

            // if has 2-3 live neighbours, live
            else if (n == 2 || n == 3) return true;

            // if > 3 live neighbours, die
            else if (n > 3) return false;
        }
        // if dead cell
        else {
            // if has 3 live neighbours, becomes live
            if (n == 3) return true;

            // else, remain dead
            return false;
        }
    }

    // returns number of live cell neighbours
    void neighbours(x, y){
        int neighbours = 0;
        for(int i = -1; i <= 1; i++){
            for(int j = -1; j <= 1; j++){
                // if not itself, and cell at coordinate is live
                if (!(i==0 && j==0) && this.grid[[x+i, y+j]]){
                    neighbours++;
                }
            }
        }
        return neighbours;
    }

    // draw game grid
    void draw(){
        noStroke();

        // cover over previous state
        fill(10, 10, 10, 150);
        rect(0, 0, width, height);

        // save state (for doing scale transformations)
        pushMatrix();

        // set stroke and fill style of live cell
        color c = color(240, 240, 240);
        fill(c);
        stroke(c, 100);

        strokeWeight(0.4);
        
        // scale canvas up for size of each cell
        scale(this.scale);

        // draw each live cell
        for(int x = 0; x < this.size.x; x++){
            for(int y = 0; y < this.size.y; y++){
                if (this.grid[[x, y]]) {
                    rect(x, y, 1, 1);
                }
            }
        }

        // restore state
        popMatrix();
    }
}