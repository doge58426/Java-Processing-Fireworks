class ExplosionParticle {
  PVector particleGravity = new PVector(0, 0.05);
  PVector position;
  PVector velocity;
  int particleSize = 5;
  int age = 0;
  int lifespan = 90;
  boolean isDead = false;
  ArrayList<PVector> trail = new ArrayList<PVector>();
  float maxSpeed = 3;
  
  ExplosionParticle(PVector _initialPosition, float angle) {
    position = _initialPosition.copy();
    
    float speed = min(.9 * randomGaussian() + 3, 3 + randomGaussian() * .08);
    velocity = PVector.fromAngle(radians(angle)).mult(speed);
  }
  
  void update() {
    position.add(velocity);
    velocity.add(particleGravity);
    
    
    age++;
    if (age > lifespan) isDead = true;
  }
  
  void display() {
    noStroke();
    fill(fireworkAccentColor, map(age, 0, lifespan, 255, 0));
    circle(position.x, position.y, particleSize);
  }
}
