/** Chain Reaction **/

ArrayList<Ball> _balls = new ArrayList<Ball>();
boolean pressed = false;

// ====================================================================
// Setup - Initialization of the World
// ====================================================================
void setup() {
  size(600,600); // World Size
  background(0); // Black
  for (int i = 0 ; i < 20 ; i++)
    _balls.add(new Ball(random(360), 2 + random(2)));
  frameRate(60); // 60 FPS Default
}

// ====================================================================
// Draw - Runs Program
// ====================================================================
void draw() {
  clear();
  for (Ball b : _balls) {
    b.update();
    
    for (Ball other : _balls) {
      if (b != other && 
          b._state == 0 &&
          other._state > 0 &&
          b.detect(other)) { //detect all balls other than self
        b._state = 1;
      }
    }
    
  }
}

void mousePressed() {
  if (!pressed) {
    _balls.add( new Ball(0,0,mouseX,mouseY,1) );
    pressed = true;
  }
}