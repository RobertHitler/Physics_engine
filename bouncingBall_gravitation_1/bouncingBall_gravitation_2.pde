class Ball {
  PVector pos, vel, acc;
  float radius,m;
  Ball (float x, float y,float r) {
    pos = new PVector (x,y);
    vel = new PVector (0,0);
    acc = new PVector (0,0);
    radius = r;
    m = radius * 0.1;
  }
  
  boolean distance(Ball other){
    return (this.pos.dist(other.pos) < this.radius + other.radius); 
  }
  
  void BallCollision (Ball other){
   /* float tempx, tempy;
    tempx = this.v.x;
    tempy = this.v.y;
    this.v.x = other.v.x;
    this.v.y = other.v.y;
    other.v.x = tempx;
    other.v.y = tempy;*/
    
    float invel;//, yinvel;
    float oinvel;//, oyinvel;
    
     invel = this.vel.x; 
     oinvel = other.vel.x; 
         
 
     this.vel.x =  (other.m*(oinvel-invel) + this.m*invel + other.m*oinvel)/( this.m + other.m);
     other.vel.x = (this.m*(invel-oinvel) + this.m*invel + other.m*oinvel)/( this.m + other.m);
         
     invel = this.vel.y;
     oinvel =other.vel.y;
          
     this.vel.y = (other.m*(oinvel-invel) + this.m*invel + other.m*oinvel)/( this.m + other.m);
     other.vel.y = (this.m*(invel-oinvel)+ this.m*invel + other.m*oinvel)/( this.m + other.m);
         
         //this.setVelocity(xinvel,yinvel);
         //other.setVelocity(oxinvel,oyinvel);
        
      if(pos.x<other.pos.x-other.radius+0.1){
        pos.x-=(1);
       }
      else if(pos.x>other.pos.x+other.radius-0.1){
        pos.x+=(1);
       }
      if(pos.y<other.pos.y-other.radius+0.1){
        pos.y-=(1);
       }
      else if(pos.y>other.pos.y+other.radius-0.1){
        pos.y+=(1);
         }  
    
         
         
       
  }
  
  boolean CheckBoundry(){
    return (pos.x > width - radius || pos.x <  radius || pos.y > height - radius || pos.y < radius);
  }
  
  void wallCollision(){
    if (pos.x > width - radius || pos.x < radius){
      vel.x = -vel.x;
    }
    if (pos.y > height - radius || pos.y < radius){
      vel.y = -vel.y;
    }
  }
  
  void update(){
    pos.add(vel);
    vel.add(acc);
   // pos.x = pos.x + vel.x;
    //pos.y = pos.y + vel.y;
  }
  
  void applyForce(PVector force){
     this.acc=force;
     this.acc.mult(0.1);
    }
  
  void display(){
    fill(27);
    ellipse(pos.x,pos.y,2*radius,2*radius);
  }
}