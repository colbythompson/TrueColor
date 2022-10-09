void gameover() {

  background(lightPink);

  fill(255);

  textSize(fontsize);
  text("GAMEOVER", width/2, 100);
  text("Play Again?", width/2, 400);

fill(darkPink);

  textSize(40);
  text("Score: " + score, width/2, 200);
  text("High Score: " + highScore, width/2, 275);

  if (fontIncreasing == true) {
    fontsize = fontsize + 1;
  } else {
    fontsize = fontsize - 1;
  }

  if (fontsize > 75) {
    fontIncreasing = false;
  } else if (fontsize < 50) {
    fontIncreasing = true;
  }//Expanding font size

  //start again button
  tactileCircle(width/2, 500, 50, 255);
  playSymbol(395, 490);
}
