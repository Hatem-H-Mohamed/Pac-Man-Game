int pacmanX = 10, pacmanY = 13; // Pac-Man's position
int dirX = 0, dirY = 0;       // Direction of movement

float pacmanMoveSpeed = 10;    // Speed of Pac-Man
float pacmanMoveCounter = 0;   // Counter to control Pac-Man speed

// Variables for Pac-Man's mouth animation
float mouthAngle = PI / 4;    // Initial mouth angle (45 degrees)
float mouthSpeed = 0.05;      // Speed of mouth animation
int mouthDirection = 1;       // 1 = opening, -1 = closing
float startAngle = 0;         // Starting angle of Pac-Man's mouth
float endAngle = TWO_PI;      // Ending angle of Pac-Man's mouth


// Draw Pac-Man's body (yellow circle)
void drawPacmanBody()
{
  fill(255, 255, 0);
  ellipse(pacmanX * gridSize + gridSize / 2, pacmanY * gridSize + gridSize / 2, gridSize - 4, gridSize - 4);
}

// Draw Pac-Man's mouth (black arc)
void drawPacmanMouth()
{
    fill(0);
    arc(pacmanX * gridSize + gridSize / 2, pacmanY * gridSize + gridSize / 2, 
    gridSize - 4, gridSize - 4, 
    startAngle, endAngle, PIE); // This draws the mouth as an arc
}

// Move Pac-Man
void PacmanMovement()
{
    pacmanMoveCounter++;
    if (pacmanMoveCounter >= pacmanMoveSpeed) {
      int nextX = pacmanX + dirX;
      int nextY = pacmanY + dirY;
      if (isValidMove(nextX, nextY)) {
        pacmanX = nextX;
        pacmanY = nextY;
      }
      pacmanMoveCounter = 0;
    }
}

void PacmanMouthAnimation ()
{
    // Update mouth angle for continuous animation
  if (mouthDirection == 1) {
    mouthAngle += mouthSpeed; // Open mouth
    if (mouthAngle >= PI / 2) { // Max open angle (90 degrees)
      mouthDirection = -1; // Start closing
    }
  } else {
    mouthAngle -= mouthSpeed; // Close mouth
    if (mouthAngle <= PI / 4) { // Min open angle (45 degrees)
      mouthDirection = 1; // Start opening
    }
  }

  // Update mouth direction based on movement direction
  if (dirX == 1 && dirY == 0) {         // Moving right
    startAngle = -mouthAngle / 2;       // Adjusted start angle
    endAngle = mouthAngle / 2;          // Adjusted end angle
  } else if (dirX == -1 && dirY == 0) { // Moving left
    startAngle = PI - mouthAngle / 2;
    endAngle = PI + mouthAngle / 2;
  } else if (dirX == 0 && dirY == -1) { // Moving up
    startAngle = -HALF_PI - mouthAngle / 2;
    endAngle = -HALF_PI + mouthAngle / 2;
  } else if (dirX == 0 && dirY == 1) {  // Moving down
    startAngle = HALF_PI - mouthAngle / 2;
    endAngle = HALF_PI + mouthAngle / 2;
  }
}
