// Define the ghosts, Pac-Man, and grid
float gridSize = 47.5; // Size of each grid cell
int cols, rows;
int pacmanX = 1, pacmanY = 1; // Pac-Man's position
int dirX = 0, dirY = 0;       // Direction of movement
int score = 0;
float pacmanMoveSpeed = 10;    // Speed of Pac-Man
float pacmanMoveCounter = 0;   // Counter to control Pac-Man speed
// Variables for Pac-Man's mouth animation
float mouthAngle = PI / 4;    // Initial mouth angle (45 degrees)
float mouthSpeed = 0.05;      // Speed of mouth animation
int mouthDirection = 1;       // 1 = opening, -1 = closing
float startAngle = 0;         // Starting angle of Pac-Man's mouth
float endAngle = TWO_PI;      // Ending angle of Pac-Man's mouth

boolean showMilestone = false; // Whether to show the milestone message
int milestoneDisplayCounter = 0; // Counter for how long to show the message
int milestoneDuration = 30; // Duration to show the message (30 frames = 0.5 seconds at 60 FPS)

boolean gameStarted = false; // Track if the game has started

// Ghost positions and directions
int[][] ghostPositions = {{9, 9}, {11, 9}, {9, 11}}; // Ghost starting positions
int[][] ghostDirections = {{0, 0}, {0, 0}, {0, 0}}; // Current directions of ghosts
float ghostMoveSpeed = 15;       // Speed of ghosts
float ghostMoveCounter = 0;      // Counter to control ghost movement speed

// Define walls and dots (1 = wall, 0 = empty space, 2 = dot)
int[][] grid = {
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

boolean isValidMove(int x, int y) {
  // Check boundaries
  if (x < 0 || x >= cols || y < 0 || y >= rows) {
    return false; // Outside the grid
  }

  // Check for walls (value 1 in the grid indicates a wall)
  if (grid[y][x] == 1) {
    return false; // It's a wall
  }

  return true; // Valid move
}



void setup() {
  size(1000, 1000);
  frameRate(60);
  cols = grid[0].length;
  rows = grid.length;
}

// Variables to manage game state
boolean gameWin = false; // Check if the player has won the game

void draw() {
  
  if (!gameStarted) {
    
    drawStartupWindow();
    return ;
  }
  else
  {
    if (!gameWin) {
      // Check if all dots have been eaten
      if (allDotsEaten()) {
        gameWin = true; // Trigger the "YOU WIN" screen
      }
    } else {
      // Show "YOU WIN" Screen
      drawWinScreen();
    }
  }
  
  background(0);

  // Check for game over (collision with a ghost)
  for (int[] ghost : ghostPositions) {
    if (pacmanX == ghost[0] && pacmanY == ghost[1]) {
      gameOver();  // Trigger the game over function
      return; // Stop the game after game over
    }
  }

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

  // Draw grid and walls
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j] == 1) { // Wall
        fill(50, 50, 200);
        rect(j * gridSize, i * gridSize, gridSize, gridSize);
      } else if (grid[i][j] == 2) { // Dot
        fill(255);  // White color for the dot
        noStroke();  // No border for the dot
        
        // Set the size of the dot to be bigger
        float dotSize = 15;  // Change this to increase the size of the dots

        // Draw the bigger dot at the grid position
        ellipse(j * gridSize + gridSize / 2, i * gridSize + gridSize / 2, dotSize, dotSize);
      }
    }
  }

  // Move Pac-Man
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

  // Draw Pac-Man's body (yellow circle)
  fill(255, 255, 0);
  ellipse(pacmanX * gridSize + gridSize / 2, pacmanY * gridSize + gridSize / 2, gridSize - 4, gridSize - 4);

  // Draw Pac-Man's mouth (black arc)
  fill(0);
  arc(pacmanX * gridSize + gridSize / 2, pacmanY * gridSize + gridSize / 2, 
      gridSize - 4, gridSize - 4, 
      startAngle, endAngle, PIE); // This draws the mouth as an arc

  // Eat dots
  if (grid[pacmanY][pacmanX] == 2) {
    grid[pacmanY][pacmanX] = 0; // Remove dot
    score++;
  }

// Display score prominently at the top of the screen
fill(255); // White text
textSize(32); // Larger font size
textAlign(LEFT, TOP); // Align text to the top-left corner
text("Score: " + score, 10, 10); // Draw the score

if (score % 10 == 0 && score > 0 && !showMilestone) {
    showMilestone = true; // Show the milestone message
    milestoneDisplayCounter = milestoneDuration; // Reset the counter
}

if (showMilestone) {
    fill(255, 215, 0); // Golden text color
    textSize(24); // Smaller font for the message
    textAlign(CENTER, CENTER);
    text("Milestone Reached!", width / 2, 50); // Draw the message at the top-center

    milestoneDisplayCounter--; // Decrease the timer
    if (milestoneDisplayCounter <= 0) {
        showMilestone = false; // Stop showing the message after the timer ends
    }
}

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

  // Draw ghosts
  fill(255, 0, 0);
  for (int[] ghost : ghostPositions) {
    ellipse(ghost[0] * gridSize + gridSize / 2, ghost[1] * gridSize + gridSize / 2, gridSize - 4, gridSize - 4);
  }
}

// Function to handle the game over
void gameOver() {
  fill(255, 0, 0);  // Red color for the game over message
  textSize(32);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width / 2, height / 2);
  noLoop();  // Stop the game loop (pause the game)
}



void keyPressed() {
  if (!gameStarted) {
    // Check if "M" is pressed to start the game
    if (key == 'm' || key == 'M') {
      gameStarted = true;
    }
    return; // Ignore other key presses until the game starts
  }

  // Movement controls for Pac-Man
  if (keyCode == UP) {
    dirX = 0;
    dirY = -1;
  } else if (keyCode == DOWN) {
    dirX = 0;
    dirY = 1;
  } else if (keyCode == LEFT) {
    dirX = -1;
    dirY = 0;
  } else if (keyCode == RIGHT) {
    dirX = 1;
    dirY = 0;
  }
}

// Variables to manage game state and UI
//boolean gameStarted = false; 
int highScore = 0;
// Function to draw the startup window
void drawStartupWindow() {
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
}

// Function to draw a button with text
void drawStartButton(float x, float y, float w, float h) {
  fill(0, 128, 255); // Blue button color
  rect(x, y, w, h, 10); // Rounded rectangle
  fill(255); // White text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("START", x + w / 2, y + h / 2);
}

// Function to check for button click
void mousePressed() {
  if (!gameStarted) {
    // Check if mouse is inside the start button
    if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 &&
        mouseY > height / 1.5 && mouseY < height / 1.5 + 50) {
      gameStarted = true; // Start the game
    }
  }
  //-----------------------------------------------------------
  if (gameWin) {
    // Check if the player clicked the Next Level button
    if (mouseX > width / 2 - 60 && mouseX < width / 2 + 60 && 
        mouseY > height / 2 && mouseY < height / 2 + 50) {
      exit();
    }
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
void drawWinScreen() {
  background(0); // Black background
  textSize(48);
  textAlign(CENTER, CENTER);
  fill(255, 255, 0); // Yellow text
  text("YOU WIN!", width / 2, height / 3);
  
  // Draw the Next Level button
  fill(0, 0, 255); // Blue button
  rect(width / 2 - 60, height / 2, 120, 50, 10); // Button with rounded corners
  fill(255); // White text
  textSize(20);
  text("Next Level", width / 2, height / 2 + 30);
}
