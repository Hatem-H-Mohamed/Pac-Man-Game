Minim minim;        // Declare Minim object

// Sound variables for various game events
AudioPlayer pacmanEatSound;        // For eating dots
AudioPlayer pacmanVictorySound;    // For victory sound
AudioPlayer pacmanDieSound;        // For death sound
AudioPlayer pacmanStartSound;      // For start sound

PImage[] ghostImages;

void mediaInit ()
{
   minim = new Minim(this); // Initialize Minim
   
    // Load all necessary sound files
    pacmanEatSound = minim.loadFile("pacman_eat.mp3");
    pacmanVictorySound = minim.loadFile("pacman_victory.mp3");
    pacmanDieSound = minim.loadFile("pacman-die.mp3");
    pacmanStartSound = minim.loadFile("pacman_start.mp3");
    
    // Check if sounds are loaded successfully
    if (pacmanEatSound != null && pacmanVictorySound != null &&
        pacmanDieSound != null && pacmanStartSound != null) {
        println("All sounds loaded successfully.");
    } else {
        println("Error: Some sound files were not found in the data folder!");
    }
    
      // Initialize the array for ghost images
    ghostImages = new PImage[3]; // Adjust size for the number of images
    
    // Load the images
    ghostImages[0] = loadImage("red.png");
    ghostImages[1] = loadImage("blue.png");
    ghostImages[2] = loadImage("green.png");
    
    for (int i = 0; i < 3; i++) {
      // Resize each image
      ghostImages[i].resize((int) (gridSize - 4), (int) (gridSize - 4));
    }
}

void stopAll() {
  
    pacmanEatSound.pause();
    pacmanVictorySound.pause();
    pacmanDieSound.pause();
    pacmanStartSound.pause();
    
}

void playStartAudio()
{
  pacmanStartSound = minim.loadFile("pacman_start.mp3");
}
