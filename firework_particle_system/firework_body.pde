void fireworkBody(color fireworkAccentColor) {
  color fireworkBodyColor = color(0, 0, 255);
  float triangleWidth = 75/2;
  float triangleHeight = triangleWidth * 2/3;
  float squareSide = triangleWidth/2;
  // body
  fill(fireworkAccentColor);
  triangle(triangleWidth/2, 0, 0, triangleHeight, triangleWidth, triangleHeight);
  fill(fireworkBodyColor);
  rect(triangleWidth/4, triangleHeight, squareSide, squareSide);
  
  // red stripes
  fill(fireworkAccentColor);
  beginShape();
  vertex(squareSide, triangleHeight);
  vertex(triangleWidth/4 * 3, triangleHeight);
  vertex(triangleWidth/4, triangleHeight + squareSide);
  vertex(triangleWidth/4, triangleHeight + triangleWidth/4);
  endShape();
  
  beginShape();
  vertex(triangleWidth/4 * 3, triangleHeight + triangleWidth/4);
  vertex(triangleWidth/4 * 3, triangleHeight + squareSide); 
  vertex(squareSide, triangleHeight + squareSide);
  endShape();
  
  // fuse
  float h = 5;
  stroke(0);
  noFill();
  translate(squareSide, triangleHeight + squareSide);
  bezier(0, 0, -3*h, 2*h, 3*h, 3*h, -1*h, 5*h);
}
