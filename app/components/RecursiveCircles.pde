class RecursiveCircles{
    RecursiveCircles(int x, int y, int radius, int level){
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.level = level;
    }

    void draw(){
        this.drawCircle(this.x, this.y, this.radius, this.level)
    }

    void drawCircle(int x, int y, int radius, int level){
        float tt = 126 * level / 4.0;
        fill(tt);

        ellipse(x, y, radius*2, radius*2);

        if(level > 1){
            level--;
            this.drawCircle(x - radius/2, y, radius/2, level);
            this.drawCircle(x + radius/2, y, radius/2, level);
        }
    }
}