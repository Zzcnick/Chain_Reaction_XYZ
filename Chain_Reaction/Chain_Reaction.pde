/** Chain Reaction **/

ArrayList<Ball> _balls = new ArrayList<Ball>();

// ====================================================================
// Setup - Initialization of the World
// ====================================================================
void setup() {
  size(600,600); // World Size
  background(0,0,0); // Black
  for (int i = 0 ; i < 20 ; i++)
    _balls.add(new Ball(random(360), 2 + random(2)));
  frameRate(60); // 60 FPS Default
}

// ====================================================================
// Draw - Runs Program
// ====================================================================
void draw() {
  for (Ball b : _balls) {
    b.update(); 
  }
}