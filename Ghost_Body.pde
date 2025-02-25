// Ghost positions and directions
int[][] ghostPositions = {{1, 1}, {1, 19}, {0, 0}}; // Ghost starting positions
int[][] ghostDirections = {{0, 0}, {0, 0}, {0, 0}}; // Current directions of ghosts
float ghostMoveSpeed = 14;       // Speed of ghosts
float ghostMoveCounter = 0;      // Counter to control ghost movement speed

void drawGhosts()
{
  int i = 0;
  // Draw ghosts
  for (int[] ghost : ghostPositions) {
    image(ghostImages[i], ghost[0] * gridSize, ghost[1] * gridSize);
    i++;
  }
}

void ghostsMovements()
{
  // Move ghosts
  ghostMoveCounter++;
  if (ghostMoveCounter >= ghostMoveSpeed) {
    for (int index = 0; index < ghostPositions.length; index++) {
      int ghostX = ghostPositions[index][0];
      int ghostY = ghostPositions[index][1];
      while (true) {
        int randDirection = int(random(0, 4));
        int newX = ghostX + (randDirection == 0 ? 1 : randDirection == 1 ? -1 : 0);
        int newY = ghostY + (randDirection == 2 ? 1 : randDirection == 3 ? -1 : 0);
        if (isValidMove(newX, newY)) {
          ghostPositions[index][0] = newX;
          ghostPositions[index][1] = newY;
          break;
        }
      }
    }
    ghostMoveCounter = 0;
  }
}
