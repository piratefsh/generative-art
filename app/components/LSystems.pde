char PLUS_ANGLE = '+';
char MINUS_ANGLE = '-';
char PUSH = '[';
char POP = ']';

class LSystems{

    LSystems(String axiom, int angle, int len){
        this.axiom = axiom;
        this.angle = angle;
        this.line = {
            x: len,
            y: len
        }
        this.rules = {};
    }

    private void addRule(String letter, String replacement){
        this.rules[letter] = replacement;
    }

    private String iterate(int n){
        String result = this.axiom.toString();
        for(int i = 0; i < n; i++){
            for(var letter in this.rules){
                var replacement = this.rules[letter];
                result = result.replace(letter.toString(), replacement.toString());
            }
        }   
        return result;
    }

    public void draw(String iteration){
        background(255);
        stroke(0, 0, 0, 100);
        for(int i = 0; i < iteration.length; i++){
            char token = new Character(iteration.charAt(i));

            for(var letter in this.rules){
                char l = new Character(letter);
                switch(token) {
                    case l:
                        line(0, 0, this.line.x, this.line.y);
                        translate(this.line.x, this.line.y);
                        break;
                    case PLUS_ANGLE:
                        rotate(radians(this.angle));
                        break;
                    case MINUS_ANGLE:
                        rotate(-1 * radians(this.angle));
                        break;
                    case PUSH:
                        pushMatrix();
                        break;
                    case POP:
                        popMatrix();
                        break;
                    default:
                        console.error('Unknown token:', token);
                }
            }
            
        }
    }
}
