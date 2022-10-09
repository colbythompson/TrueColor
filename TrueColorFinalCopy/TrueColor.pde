//Colby Thompson
//Sept 26, 2022
//TRUECOLOR

//Sound/music imports
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//color pallette
final static color darkPink = #fb6f92 ;
final static color lightPink = #ffc8dd;
final static color lightBlue = #8ecae6 ;
final static color red = #d11149 ;
final static color orange = #f06305 ;
final static color yellow = #fadf7f ;
final static color green = #3ddc97 ;
final static color blue = #5ad2f4 ;
final static color purple = #9d80cb ;

//generating a random color/number
int randomWord;
int randomColor; //starting from one and up to ten // (int) chops off decimal

final static String[] words = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"} ;
final static color[] colors = {red, orange, yellow, green, blue, purple} ;

//gameplay variables
boolean correct; //when answer is correct
boolean matching;
boolean notMatching;
int score; //counts correct answers in a row
int highScore; //high score
int timer; //timer of gameplay


//Intro Gif Variables
PImage[] gif;
int numberOfFrames;
int f; //page #
PFont Comico;

//Mode Variables
int mode;
final int INTRO = 0;
final int GAMEPLAY = 1;
final int GAMEOVER = 2;

//Text Size Variables
float fontsize; //standard font
boolean fontIncreasing;

Minim minim;
AudioPlayer song; //stores song
AudioPlayer failure; //incorrect answer
AudioPlayer success; //correct answer

void setup () {
  size (800, 600);

  //orginal gamemode
  mode = INTRO;

  //text
  textAlign(CENTER, CENTER); //places text in center
  fontsize = 55;
  fontIncreasing = true;

  //score keeping
  score = 0;
  highScore = 0;

  //Intro Gif
  numberOfFrames = 24;
  gif = new PImage[numberOfFrames];

  int i = 0; //where the pattern starts
  while (i < numberOfFrames) { //while statement keeps going back to the start as long as the statement is true
    gif[i] = loadImage("frame_"+i+"_delay-0.08s.gif"); //what's stored // +i+ adds in variable
    i=i+1; //++ increases by 1

    //Font
    Comico = createFont("Comico.ttf", 200); //Custom font

    //Music/ sounds
    minim = new Minim(this);
    song = minim.loadFile("MUSIC.mp3");
  }
}

void draw() { //START OF DRAW//

  if (mode == INTRO) {
    intro();
  } else if (mode == GAMEPLAY) {
    gameplay();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error: Mode is " + mode) ;
  }
}

void mousePressed () {

  if (mode == INTRO) {
    //Intro Button
    if (touchingCircle(width/2, 350, 50)) {
      mode = GAMEPLAY;
    }
  } else
    //GAMEPLAY MODE
    if (mode == GAMEPLAY) {

      //Correct Answer
      if ((touchingRect(0, 0, 400, height) &&  (randomColor == randomWord))
        || (touchingRect(405, 0, 395, height) && (randomColor != randomWord))) {
        correct = true;
      }

      //Incorrect Answer
      else {
        correct = false;
      }

      //if answer is correct, new word is given and success sound plays
      if (correct == true) {
        new_word();
        minim.loadFile("SUCCESS.wav").play();
        score += 1;
      } else {
        gameover_start();
      }
    }

  if (mode == GAMEOVER) {
    //PLAY AGAIN
    if (touchingCircle(width/2, 500, 50)) {
      new_word();
      mode = INTRO;
      score = 0;
    }
  }
}

void keyReleased() {
  //Correct Answer
  if (mode == GAMEPLAY) {
    if (keyCode == LEFT &&  (randomColor == randomWord)
      || (keyCode == RIGHT &&  (randomColor != randomWord))) {
      correct = true;
    }

    //Incorrect Answer
    else {
      correct = false;
    }
  }

  //if answer is correct, new word is given and success sound plays
  if (correct == true) {
    new_word();
    minim.loadFile("SUCCESS.wav").play();
    score += 1;
  } else {
    gameover_start();
  }
}

/**
 creates a new word and resets timer for game
 */
void new_word() {
  timer = 0;
  float sameColor = random(0, 1); //if the color is same as the word
  sameColor = (float) random(0, 1);
  if (sameColor < 0.5) {
    randomColor = (int) random(0, 6);
    randomWord = randomColor; //matching puzzle
  } else {
    do { //does ___ while ___ is also happening
      randomColor = (int) random(0, 6);
      randomWord = (int) random(0, 6);
    } while (randomColor == randomWord);
  }
}

/**
 start of gameover
 */
void gameover_start() {
  //losing sound
  minim.loadFile("FAILURE.wav").play();
  mode = GAMEOVER;
  if (score > highScore) {
    highScore = score;
  }
}
