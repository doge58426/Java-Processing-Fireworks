class Firework {
  PVector position = new PVector();
  PVector velocity = new PVector();
  float angle;
  Firework(PVector _spawnPosition, PVector _velocity) {
    position = _spawnPosition.copy();
    velocity = _velocity;
    
  }
  
   void update() {
     velocity.add(gravity);
     position.add(velocity);
     angle = atan2(velocity.y, velocity.x) + .5*PI;
   }
   
   void display() {
     pushMatrix();
     translate(position.x, position.y);

     
     rotate(angle);
     translate(-75/2, -0.5*(75/2 + 50));
     fireworkBody(fireworkAccentColor);
     popMatrix();
   }
}
