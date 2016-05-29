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
  Ball() {
    float randSpeed = 2 + random(2);
    float randAngle = random(360);
    _dx = randSpeed * cos(randAngle);
    _dy = randSpeed * sin(randAngle);
    _state = 0;
    _x = random(600); //random float [0, 600)
    _y = random(600);
    _size = 30;
    _color = new int[3]; // TO UPDATE
  }
  Ball(float angle, float speed) {
    this();
    _dx = speed * cos(angle);
    _dy = speed * sin(angle);
  }
  
  Ball(float angle, float speed, int x, int y, int state) { //this looks kind of out of place :P
    this(angle, speed);
    _x = x;
    _y = y;
    _state = state;
  }
  
  
  // ====================================================================
  // Ball Movement - State 0: Moving
  // ====================================================================
  /* reflect() - If the ball hits a wall, negate the appropriate velocity
   * precond: none
   * postcond: dx or dy is negated depending on where the ball reflects */
  void reflect() {
    //robustify to allow for any window size
    if (_x <= 0 || _x >= 600) {
      _dx = -(_dx);
    }
    if (_y <= 0 || _y >= 600) {
      _dy = -(_dy);
    } 
  }
  
  /* tick() - Moves the ball according to its dx and dy values
   * precond: 
   * postcond: x and y are updated accordingly */
  void tick() { // Name subject to change
    _x += _dx;
    _y += _dy;
  }
  
  // ====================================================================
  // Chain Reaction - State 1,2: Expanding and Shrinking
  // ====================================================================
  /* updateSize() - Changes the size of the ball depending on its state
   * precond: start > 0 (not dead or moving)
   * postcond: size is updated according to the state of the ball */
   void updateSize() {
     if (_state == 1) { //expanding
       if (_size >= 150) //start shrinking at size=200
         _state = 2; 
       else _size++;
     }
     else { //shrinking
       if (_size <= 0)
         _state = -1;
       else _size--;
     }
     
   }
  
  /* detect() - Returns a boolean indicating whether this ball has collided with an
   *            expanding or shrinking ball
   * precond: parameter other is a Ball
   * postcond: boolean indicating whether the two balls are touching */
   boolean detect(Ball other) {
     if ( (_size + other._size)/2 > cartDist(this, other) ) { //if other ball is within 1 unit from me
       return true;
     }
     return false;
   }
   
   /* cartDist() - Returns Cartesian distance between 2 balls
   * precond: parameters ball1 and ball2 are Balls
   * postcond: float representing distance between the 2 given balls */
   float cartDist(Ball ball1, Ball ball2) {
      return sqrt( sq(ball1._x - ball2._x) +  
                   sq(ball1._y - ball2._y) ); 
   }
   
  // ====================================================================
  // State Changing
  // ====================================================================
  /* updateState() - Updates state of the ball
   * precond: 
   * postcond: state reflects the state of the ball */
   void updateState() {
     if (_state > 0)
       updateSize();
     if (_size <= 0)
       _state = -1;
   }
   
  // ====================================================================
  // Updating Image - Prints Ball onto canvas
  // ====================================================================
  void update() {
    
    if (_state != -1) {
      if (_state == 0) {
        reflect();
        tick();
      }
      else updateSize(); //state should be 1 or 2
      
      ellipse (_x, _y, _size, _size);
    }
    
  }
  
  
}