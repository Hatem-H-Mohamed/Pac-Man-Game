int level = 1; // Track the current level

// Display the current level
void drawCurrentLevel()
{
  
  fill(255); // White text
  textSize(32); // Larger font size
  textAlign(CENTER, TOP);
  text("Level: " + level, 500, 10); // Draw the score
}

// Function to transition to the next level
void nextLevel() {
  
  pacmanVictorySound.rewind();
  pacmanVictorySound.play();
  
  // Add the current level's score to the totalScore score
  totalScore += score;

  // Increase the speed of the ghosts to make the game harder
  if (ghostMoveSpeed > 1)
  {
    ghostMoveSpeed-=2;
  }

  // Reset Pac-Man's position (or you can add a transition animation)
  pacmanX = 10;
  pacmanY = 13;

  // Reset the grid, removing any eaten dots (you could also add new dots if desired)
  grid   = new int [][] {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1},
  {1, 2, 1, 1, 2, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 2, 1, 1, 2, 1},
  {1, 2, 1, 1, 2, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 2, 1, 1, 2, 1},
  {1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1},
  {1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1},
  {1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1},
  {1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1},
  {0, 0, 0, 0, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 2, 1, 2, 1, 1, 0, 1, 1, 2, 1, 2, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 2, 2, 2, 1, 0, 0, 0, 1, 2, 2, 2, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 2, 1, 2, 1, 0, 0, 0, 1, 2, 1, 2, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 0, 0, 0, 0},
  {1, 1, 1, 1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 1, 1, 1, 1},
  {1, 2, 2, 2, 2, 2, 1, 2, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 1},
  {1, 2, 1, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 1},
  {1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1},
  {1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 2, 1, 1, 1},
  {1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1},
  {1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

  // Increase the difficulty by making the grid more complex, or add new ghosts if desired
  level++; // Increase the level

  // Reset the current score for the new level
  score = 0;
  
  // Optionally show the level transition (you could create a simple message here)
  showLevelTransition();
  
    pacmanX = 10;
    pacmanY = 13;
    
    dirX = 0;
    dirY = 0;
    
    ghostPositions = new int [] [] {{1, 1}, {10, 19}, {19, 1}};
    ghostDirections = new int [] [] {{0, 0}, {0, 0}, {0, 0}};
}

// Function to display the level transition message
void showLevelTransition() {
  fill(255, 215, 0); // Golden color for the level message
  textSize(32); // Large text for level
  textAlign(CENTER, CENTER);
  text("Level " + level, width / 2, height / 2); // Display level number
  delay(1000); // Delay for 1 second to display the level
}
