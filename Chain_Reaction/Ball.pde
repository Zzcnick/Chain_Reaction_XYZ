/** Ball Class **/

class Ball {
  // ====================================================================
  // Instance Variables
  // ====================================================================
  float _dx, _dy, _x, _y, _size;
  int _state;
  int[] _color; 
 
  // State Variable: (Subject to Change)
  // -1 - Dead
  // 0 - Moving
  // 1 - Expanding
  // 2 - Shrinking
  
  // ====================================================================
  // Default Constructor
  // ====================================================================
  Ball(float angle, float speed) {
     ;
     _color = new int[3]; // TO UPDATE
  }
  
  // ====================================================================
  // Ball Movement - State 0: Moving
  // ====================================================================
  /* reflect() - If the ball hits a wall, negate the appropriate velocity
   * precond: none
   * postcond: dx or dy is negated depending on where the ball reflects */
  void reflect() {
    ; 
  }
  
  /* tick() - Moves the ball according to its dx and dy values
   * precond: 
   * postcond: x and y are updated accordingly */
  void tick() { // Name subject to change
    ;
  }
  
  // ====================================================================
  // Chain Reaction - State 1,2: Expanding and Shrinking
  // ====================================================================
  /* updateSize() - Changes the size of the ball depending on its state
   * precond: start != -1 (not dead)
   * postcond: size is updated according to the state of the ball */
   void updateSize() {
     ; 
   }
  
  /* detect() - Returns a boolean indicating whether this ball has collided with an
   *            expanding or shrinking ball
   * precond: paramater ball is a ball
   * postcond: boolean indicating whether the two balls are touching */
   boolean detect(Ball ball) {
     return false;
   }
   
  // ====================================================================
  // State Changing
  // ====================================================================
  /* updateState() - Updates state of the ball
   * precond: 
   * postcond: state reflects the state of the ball */
   void updateState() {
     ; 
   }
   
  // ====================================================================
  // Updating Image - Prints Ball onto canvas
  // ====================================================================
  void update() {
    ; // CODE HERE
    ellipse (_x, _y, _size, _size);
  }
}