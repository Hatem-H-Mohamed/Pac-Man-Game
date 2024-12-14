

void drawWinScreen() {
  background(0); // Black background
  // Save current transformation state
  pushMatrix();
  
  // Apply a rotation and scaling transformation
  translate(width / 2, height / 3); // Move to the text's position
  float rotationAngle = frameCount * 0.05; // Rotate based on frame count
  float scaleFactor = 1 + 0.5 * sin(frameCount * 0.1); // Scale up and down
  rotate(rotationAngle);  // Apply rotation
  scale(scaleFactor);     // Apply scaling
  
  // Draw the text after transformation
  fill(255, 255, 0); // Yellow text
  textSize(48);
  textAlign(CENTER, CENTER);
  text("YOU WIN!", 0, 0); // Position (0, 0) because we already translated to (width / 2, height / 3)
  
  // Restore the previous transformation state
  popMatrix();
  
  // Draw the Next Level button
  fill(0, 0, 255); // Blue button
  rect(width / 2 - 60, height / 2, 120, 50, 10); // Button with rounded corners
  fill(255); // White text
  textSize(20);
  text("Next Level", width / 2, height / 2 + 30);
}
