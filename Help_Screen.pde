

void drawHelpPage()
{
  background(50);
  fill(255);
  textAlign(CENTER, TOP);
  textSize(50);
  text("Help!", width / 2, 20);

  textAlign(CENTER, CENTER);
  textSize(30);
  text("How to Play:\n\n- Use arrow keys to navigate Pac-Man.\n- Collect all dots to win.\n- Avoid ghosts to survive.\n\nGood luck!", width / 2, height / 2);

  // Back Button
  fill(200, 0, 0);
  rect(width / 2 - 50, height / 2 + 300, 100, 50, 10);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Back", width / 2, height / 2 + 20 + 300);

}
