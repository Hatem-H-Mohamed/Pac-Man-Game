import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


boolean gameStarted = false;
boolean gameWin = false;
boolean gameOver = false;
boolean showHelp = false;
boolean endGame = false;


void setup() {
  size(1000, 1000);
  frameRate(60);
  cols = grid[0].length;
  rows = grid.length;
  
  loadHighScore(); // Load the high score when the game starts
  
  mediaInit(); //init the media
}

void draw() {
  
  if (!gameStarted && !gameOver) {
      score = 0;
      totalScore = 0;
      stopAll(); //stop all the sounds on beginning
      if (showHelp) {
          drawHelpPage(); // Display the Help Page
          return;
      } else {
          drawStartupScreen(); // Display the Startup Window
          return;
      }
  }
  else if (gameOver)
  {
    gameOver();
    return;
  }
  
  else {
      
      if (!gameWin) {
          // Check if all dots have been eaten
          if (allDotsEaten()) {
              gameWin = true; // Trigger the "YOU WIN" screen
              nextLevel();
              return;
          }
      } else {
          // Show "YOU WIN" Screen
          drawWinScreen();
          return;
      }
  }
 
  
 
  background(0);

  // Check for game over (collision with a ghost)
  gameOverCheck();

  
  //Draw the Map
  DrawMap();
  
  // Draw end button
  drawEndButton(10, 450, 100, 50);
  
  // Draw Pac-Man's body (yellow circle)
  drawPacmanBody();

  // Draw Pac-Man's mouth (black arc)
  drawPacmanMouth();

  // Move Pac-Man
  PacmanMovement();
  
  // Draw the Pac-Man mouth animations and directions
  PacmanMouthAnimation();

  // Eat dots
  eatCheck();

  // Display current score for the current level
  drawCurrentScore();  

  // Display the total score for all levels you passed
  drawTotalScore();

  // Display the current level  
  drawCurrentLevel();
  
  // Display the high score
  drawHighScore();

  // Draw ghosts
  drawGhosts();
  
  //// Move ghosts
  ghostsMovements();


}

void keyPressed() {

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
  
  
  if (gameOver)
  {
    if (keyCode == ENTER)
      gameOver = false;
  }
  
  
}

// Function to check for button click
void mousePressed() {
    if (!gameStarted && !showHelp) {
        // Check if Start Button is clicked
        if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 &&
            mouseY > height / 1.5 && mouseY < height / 1.5 + 50) {
            gameStarted = true; // Start the game
            level = 1;
            reset();
            if (!pacmanStartSound.isPlaying()) {
                pacmanStartSound.play(); // Play the sound when the game starts
            }
        }

        // Check if Help Button is clicked
        if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 &&
            mouseY > height / 1.5 + 60 && mouseY < height / 1.5 + 110) {
            showHelp = true; // Show the help screen
        }
    } else if (showHelp) {
        // Check if Back Button is clicked on Help Screen
        if (mouseX > width / 2 - 50 && mouseX < width / 2 - 50 + 100 && mouseY > height / 2 + 300 && mouseY < height / 2 + 300 + 50) {
            showHelp = false; // Return to Startup Screen
        }
    }

    if (gameStarted) {
        // Check if End Button is clicked
        if (mouseX > 10 && mouseX < 10 + 100 && mouseY > 450 && mouseY < 450 + 50) {
            gameStarted = false; // Return to Startup Screen
            gameWin = false; // Reset win state
        }
    }

    if (gameWin) {
        // Check if the player clicked the Next Level button
        if (mouseX > width / 2 - 60 && mouseX < width / 2 + 60 &&
            mouseY > height / 2 && mouseY < height / 2 + 50) {
            gameWin = false; // Proceed to next level
        }
    }
}


void stop()
{
  minim.stop();
  super.stop();
}
