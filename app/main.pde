//Hello mouse.

void setup() {
    size(400, 400);
    stroke(255);
    background(192, 64, 0);
}

void draw() {
    int x = 150;
    int y = 25;
    line(x, y, mouseX, mouseY);
}