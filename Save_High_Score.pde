//String highScoreFile = "path/data/High_Score.txt"; // File to store high score
String highScoreFile = "D:/Main/data/High_Score.txt"; // File to store high score

// Function to save the high score to a file
void saveHighScore() {
  try {
    String[] data = { str(highScore) }; // Convert the high score to a string array
    saveStrings(highScoreFile, data);  // Save the array to the file
    println("High score saved to " + highScoreFile + ": " + highScore);
  } catch (Exception e) {
    println("Failed to save high score: " + e.getMessage());
  }
}

// Function to load the high score from the file
void loadHighScore() {
  try {
    if (new File(highScoreFile).exists()) { // Check if the file exists
      String[] data = loadStrings(highScoreFile); // Attempt to load the high score file
      if (data != null && data.length > 0) {
        highScore = int(data[0]); // Parse the high score from the file
      }
    } else {
      println("High score file not found. Starting with default high score: " + highScore);
    }
  } catch (Exception e) {
    println("Error loading high score: " + e.getMessage());
  }
  println("High score loaded: " + highScore);
}
