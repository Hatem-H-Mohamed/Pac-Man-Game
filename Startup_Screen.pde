// Function to draw the startup window
void drawStartupScreen() {
  background(0); // Black background
  
  // Title
  textAlign(CENTER);
  fill(255, 255, 0); // Yellow color
  textSize(48);
  text("PAC-MAN", width / 2, height / 3);
  
  // High score display
  fill(255); // White color
  textSize(24);
  text("Highest Score: " + highScore, width / 2, height / 2);
  
  // Start button
  drawStartButton(width / 2 - 50, height / 1.5, 100, 50);
  
  // Start button
  drawHelpButton(width / 2 - 50, height / 1.5 + 70, 100, 50);
}

// Function to draw the start button
void drawStartButton(float x, float y, float w, float h) {
  fill(0, 128, 255); // Blue button color
  rect(x, y, w, h, 10); // Rounded rectangle
  fill(255); // White text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("START", x + w / 2, y + h / 2);
}

// Function to draw the Help button
void drawHelpButton(float x, float y, float w, float h) {
  fill(0, 128, 255); // Blue button color
  rect(x, y, w, h, 10); // Rounded rectangle
  fill(255); // White text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Help!", x + w / 2, y + h / 2);
}
