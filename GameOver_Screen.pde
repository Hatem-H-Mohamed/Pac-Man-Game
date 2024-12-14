
// Function to draw the game over text
void gameOver() {
  fill(255, 0, 0);
  rect(width / 2 - 200, height / 2, 400, 100, 10); 
  
  fill(255); // White text
  textSize(33);
  textAlign(CENTER, CENTER);
  text("GAME OVER!", width / 2 , height / 2 + 25);
  
  fill(255); // White text
  textSize(23);
  textAlign(CENTER, CENTER);
  text("Press \"Enter\" to Play Again.", width / 2 , height / 2 + 65);
}

// Check for game over (collision with a ghost)
void gameOverCheck()
{
  for (int[] ghost : ghostPositions) {
    if (pacmanX == ghost[0] && pacmanY == ghost[1]) {
      if (totalScore > highScore)
      {
        highScore = totalScore;
        saveHighScore();
      } 
      gameOver = true;
      gameOver();  // Trigger the game over function
      
      gameStarted = false; // Return to Startup Screen
      gameWin = false; // Reset win state
      return;
    }
  }
}
