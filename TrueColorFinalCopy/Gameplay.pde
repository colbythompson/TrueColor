void gameplay() {

  timer = timer + 1;
  if (timer > 250) {
    gameover_start();
  }

  textFont(Comico);

  stroke(0) ;

  //Matching
  tactileRect(0, 0, 400, height, 175) ;


  //Text
  textSize(50);
  fill(255);
  text("Matching", 200, 75) ;


  //Not Matching
  tactileRect(405, 0, 395, height, 200) ;

  //Text
  textSize(50);
  fill(255);
  text("Not Matching", 600, 75) ;

  //Gameplay expanding text
  textSize(timer * 0.5 + 20);
  fill(colors[randomColor]) ;
  text(words[randomWord], width/2, height/2) ;

  //Score Keeping
  textSize(50);
  fill(255);
  text(score, 50, 500);
}

//Boolean for rectangle Button
boolean touchingRect(int x, int y, int w, int h) { //if mouse is inside rectangle
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true ;
  } else {
    return false ;
  }
}

void tactileRect(int x, int y, int w, int h, color f) { //Function for Rectangles
  fill(f) ;
  if (touchingRect(x, y, w, h) ) { //if true
    stroke(darkPink) ; // if touching (true), outline = white
  } else { //if false
    stroke(255); //if not touching (false), outline = black
  }

  rect(x, y, w, h) ;
}
