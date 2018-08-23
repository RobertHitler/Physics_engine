Ball[] balls = {new Ball (100,300,random(20,30)),
                new Ball(300,100,random(40,55))};


void setup(){
  size(420,420);
  
}


void draw(){
  background(200);
  
  for (Ball ball : balls) {
     PVector gravity = new PVector(random(0.010,0.01),random(0.2,0.3));// Apply gravity
    ball.applyForce(gravity);
  }
  
  for (int i = 0; i < balls.length; i++){
    balls[i].display();
    balls[i].update();
    if(balls[i].CheckBoundry()){
      balls[i].wallCollision();
    }
  }
  for (int i = 0; i < balls.length; i++){
    for (int j = i; j < balls.length; j++){
      if (balls[i].distance(balls[j])){
        balls[i].BallCollision(balls[j]);
      }
    }
  }
}