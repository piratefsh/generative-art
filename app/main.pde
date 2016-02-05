int width = Math.floor(window.innerWidth);
int height = Math.floor(window.innerHeight);


LSystems l;
String iteration;
void setup()
{
    size(width, height);
    background(250);
    hint(ENABLE_OPENGL_4X_SMOOTH);

    l = kochSnowflake();

    noLoop();
}

void draw(){  
    translate(100, 200, 0);
    String it = l.iterate(4);
    l.draw(it);
}

LSystems dragonCurve(){
    // tumbleweed
    String axiom = 'X';
    int angle = 90;
    LSystems l = new LSystems(axiom, angle, 6);
    l.addRule('X', 'X+Y+');
    l.addRule('Y', '-X-Y');
    return l;

}

LSystems kochSnowflake(){
    // tumbleweed
    String axiom = 'F++F++F';
    int angle = 60;
    LSystems l = new LSystems(axiom, angle, 2);
    l.addRule('F', 'F-F++F-F');
    return l;

}
LSystems tumbleweed(){
    // tumbleweed
    String axiom = 'F';
    int angle = 10;
    LSystems l = new LSystems(axiom, angle, 10);
    l.addRule('F', 'F[-F]+F');
    return l;
}
