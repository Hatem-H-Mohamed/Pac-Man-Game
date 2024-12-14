float gridSize = 47.619; // Size of each grid cell
int cols, rows;

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


void DrawMap()
{
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
}

boolean isValidMove(float x, float y) {
  // Check boundaries
  if (x < 0 || x >= cols || y < 0 || y >= rows) {
    return false; // Outside the grid
  }

  // Check for walls (value 1 in the grid indicates a wall)
  if (grid[(int)y][(int)x] == 1) {
    return false; // It's a wall
  }

  return true; // Valid move
}

void drawEndButton(float x, float y, float w, float h) {
  fill(0, 128, 255); // Blue button color
  rect(x, y, w, h, 10); // Rounded rectangle
  fill(255); // White text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("End", x + w / 2, y + h / 2);
}
