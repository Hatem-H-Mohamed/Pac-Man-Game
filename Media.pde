Minim minim;        // Declare Minim object
AudioPlayer ghostSound; // Declare an AudioPlayer object

PImage ghostImage; // Declare ghostImage as a global variable

void mediaInit ()
{
   minim = new Minim(this); // Initialize Minim
   ghostSound = minim.loadFile("ghost_sound.mp3"); // Load the .mp3 file
    
   if (ghostSound != null) {
        println("Sound loaded successfully.");
   } else {
        println("Error: ghost_sound.mp3 not found in the data folder!");
   }
    
   ghostImage = loadImage("ghost.png"); // Load the ghost image
   ghostImage.resize((int) (gridSize - 4), (int) (gridSize - 4));
}

void stop() {
    ghostSound.close(); // Release resources when the sketch stops
    minim.stop();
}

void play()
{
  ghostSound = minim.loadFile("ghost_sound.mp3");
}
