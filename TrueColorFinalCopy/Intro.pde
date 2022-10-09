void intro() {
  //plays intro music
  song.play();

  //gif
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == numberOfFrames) f = 0; //opening screen animation

  textFont(Comico);
  textSize(fontsize);
  fill(255);
  text("TRUE COLOR", width/2, 250); //opening screen font


  //Word 'animation'
  if (fontIncreasing == true) {
    fontsize = fontsize + 1;
  } else {
    fontsize = fontsize - 1;
  }

  if (fontsize == 90) {
    fontIncreasing = false;
  } else if (fontsize < 60) {
    fontIncreasing = true;
  }

  strokeWeight(5);

  //Start Button
  tactileCircle(width/2, 350, 50, 255);

  //Play symbol for intro
  playSymbol(395, 340);
  
}

//Boolean for start button
boolean touchingCircle(int x, int y, int r) { //if mouse is inside circle
  if (dist(x, y, mouseX, mouseY) < r) { //if (parameters) are < radius, return true
    return true;
  } else {
    return false;
  }
}

//CIRCLE FUNCTION (for b y
void tactileCircle(int x, int y, int r, color f) { //Function for Circles
pushMatrix();
translate(x, y);
  fill(f) ;
  if (touchingCircle(x, y, r) ) { //if true
    stroke(255); //if distance between x, y coords & mouse coords < 100, stroke turns ____
    fill(darkPink);
  } else {
    stroke(darkPink);
  }
  circle(0, 0, r); //x, y, diameter
  popMatrix();
}

void playSymbol(int x, int y) {
  //Play symbol
  fill(lightBlue);
  stroke(lightBlue);
  triangle(x, y, x + 15, y + 10, x, y + 20);
}
