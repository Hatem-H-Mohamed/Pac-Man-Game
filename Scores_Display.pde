
int score = 0, highScore = 0;
int totalScore = 0; // Track the total score across levels


// Display the current score for the current level
void drawCurrentScore()
{
  fill(255); // White text
  textSize(32); // Larger font size
  textAlign(LEFT, TOP);
  text("Score: " + score, 10, 10); // Draw the score
}

// Display the total score for all levels you passed
void drawTotalScore()
{
  
  fill(255); // White text
  textSize(32); // Larger font size
  textAlign(RIGHT, TOP);
  text("Total Score: " + totalScore, 1000, 10); // Draw the score
}

void drawHighScore()
{
  
  fill(255); // White text
  textSize(32); // Larger font size
  textAlign(LEFT, BOTTOM);
  text("High Score: " + highScore, 10, 1000); // Draw the score
}
