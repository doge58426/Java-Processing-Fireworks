PVector gravity = new PVector(0, 0.1);
color fireworkAccentColor;
ArrayList<Firework> fireworks;
ArrayList<ExplosionParticle> explosionParticles;
float numParticles = 1000;
boolean inAnimation = false;

void setup() {
  size(800, 450);
  colorMode(HSB);
  frameRate(60);
  background(100);
  
  explosionParticles = new ArrayList<ExplosionParticle>();
  fireworkAccentColor = color(random(255), 100, 255);
  fireworks = new ArrayList<Firework>();
  fireworks.add(new Firework(new PVector(width, height), new PVector(0, -10).rotate(radians(random(-45, -35)))));
}

void draw() {
  background(100);
  
  for (int i = fireworks.size() - 1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.display();
    f.update();
    
    if (f.position.x > width + 75 || f.position.x < -75) {
      fireworks.remove(i); 
    }
    if (f.position.y > height + 75 || f.position.y < -75) {
      fireworks.remove(i);  
    }
  }
  
  if (inAnimation == true) {
    for (ExplosionParticle p : explosionParticles){
      
      p.display();
      p.update();
      if (p.isDead == true) {
        inAnimation = false;
        explosionParticles.clear();
        break;
      }
    }
  }
}

void explode(Firework firework) {
  fireworks.remove(firework);
  
  for (int i = 0; i < numParticles; i++) {
    explosionParticles.add(new ExplosionParticle(firework.position, (360/numParticles) * i));
    println((360/numParticles) * i);
  } 
  inAnimation = true;
}

void mousePressed() {
  if (fireworks.isEmpty() == false) {
    explode(fireworks.get(fireworks.size() - 1));
  }
}
