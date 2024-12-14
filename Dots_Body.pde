
void eatCheck()
{
  // Eat dots
  if (grid[pacmanY][pacmanX] == 2) {
    grid[pacmanY][pacmanX] = 0; // Remove dot
    score++;
    totalScore++;
  }
}

boolean allDotsEaten() {
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == 2) {
        return false; // There's at least one dot left
      }
    }
  }
  return true; // All dots are eaten
}
