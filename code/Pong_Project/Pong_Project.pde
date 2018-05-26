/**
*Pong Project
*by Caleb Kryton
*Computer Science and Coding 10
*
*The purpose of this project is to experiment with modifiers, controllable
*objects and getting a ball to bounce around the screen. It is my major project 
*for my Computer Science 10 class.
*It is also to experiment with making my first game.
*
*I will also experiment with alternative organization practices from my typical projects
*so if the code looks different from then that's why.
*/

int x, y, w, h, speedX, speedY;//Create integers for circle parameters
//I put all the integers on the same line instead of a list to save on memory.

int padLX, padLY, padLW, padLH, padLS;//Create integers for left paddle, known here as padL. Integers follow same order as above
boolean upL, downL;//Variables for movement of left paddle with keyPressed/Released

int padRX, padRY;//Create integers for right paddle, known here as padR. Integers follow same order as above
boolean upR, downR;//Variables for movement of right paddle with keyPressed/Released

int scoreL = 0;
int scoreR = 0;

int winScore = 5;

void setup() {
  size(750,750);//Size of the canvas, subject to change
  
  x = width/2;//List circle parameters
  y = height/2;
  w = 50;
  h = 50;
  speedX = 4;
  speedY = 3;
  
  rectMode(CENTER);
  padLX = 50;//Left paddle coordinates
  padLY = height/2;
  
  padRX = width-50;//Right paddle coordinates
  padRY = height/2;
  
  padLW = 20;//paddle parameters
  padLH = 75;
  padLS = 5;
  
  textSize(30);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);//Color of canvas
  
  circleDraw();//Call from void circleDraw
  circleMove();//Call from void circleMove
  wallBounce();//Call from void wallBounce
  
  padLRDraw();//Call from void padLRDraw
  padLRMove();//Call from void padLRMove
  padLRLimit();//Call from void padLRLimit
  padLRHit();//Call from void padLRHit
  
  scores();
  gameOver();
}

void padLRDraw() {//Draw the paddles
  fill(255);
  rect(padLX, padLY, padLW, padLH);
  rect(padRX, padRY, padLW, padLH);
}

void padLRMove () {//Move the paddles with corresponding keys listed in void keyPressed & keyReleased
  if(upL == true) {
    padLY = padLY - padLS;
  }
  if(downL == true) {
    padLY = padLY + padLS;
  }
  if(upR == true) {
    padRY = padRY - padLS;
  }
  if(downR == true) {
    padRY = padRY + padLS;
  }
}

void padLRLimit() {//Set window limit so paddles dont move off screen
  if(padLY - padLH/2 < 0) {
    padLY = padLY + padLS;
  }
  if(padLY + padLH/2 > height) {
    padLY = padLY - padLS;
  }
  if(padRY - padLH/2 < 0) {
    padRY = padRY + padLS;
  }
  if(padRY + padLH/2 > height) {
    padRY = padRY - padLS;
  }
}

void padLRHit(){//Set rules for if the ball hits the paddles
  if(x - w/2 < padLX + padLW/2 && y - h/2 < padLY + padLH/2 && y + h/2 > padLY - padLH/2) {
    if(speedX < 0) {//Fixes glitch if the ball hit under or above the paddle
    speedX = -speedX;//Left paddle collision
    }
  }
  else if(x + w/2 > padRX - padLW/2 && y - h/2 < padRY + padLH/2 && y + h/2 > padRY - padLH/2) {
    if(speedX > 0) {//Fixes glitch if the ball hit under or above the paddle
    speedX = -speedX;//Right paddle collision
    }
  }
}

void circleDraw() {//Draw the circle
  fill(255,255,255);//Color of circle
  ellipse(x, y, w, h);
}

void circleMove() {//Make the circle move
  x = x + speedX;
  y = y + speedY;
}

void wallBounce() {//If and if else statements to bounce off wall 
  
  if(x > width - w/2) {
    setup();//Resets to initial setup
    speedX = -speedX;
    scoreL = scoreL + 1;
  }
  else if ( x < 0 + w/2) {
    setup();//Resets to initial setup
    scoreR = scoreR + 1;
  }
  
  if( y > height - h/2) {
    speedY = -speedY;
  }
  
  else if( y < 0 + h/2) {
    speedY = -speedY;
  }
}

void gameOver() {
  if(scoreL == winScore) {
    gameOverPage("Player 1 Wins!"); 
  }
  
  if(scoreR == winScore) {
    gameOverPage("Player 2 Wins!");
  }
}

void gameOverPage(String text) {
  
  speedX = 0;
  speedY = 0;
  
  text("Game over", width/2, height/3 -40);
  text(text, width/2, height/3);
  text("Click to Play again", width/2, height/3 + 40);
  
  if(mousePressed) {
    scoreR = 0;
    scoreL = 0;
    speedX = 4;
    speedY = 3;
  }
}

void keyPressed() {//Set key commands for left and right paddle
  if(key == 'w' || key == 'W') {
    upL = true;
  }
  
  if(key == 's' || key == 'S') {
    downL = true;
  }
  if(keyCode == UP) {
    upR = true;
  }
  
  if(keyCode == DOWN) {
    downR = true;
  }
}

void scores() {
  fill(255);
  text(scoreL, 100, 50);
  text(scoreR, width-100, 50);
}

void keyReleased() {//For when the key is released, makes movement smoother
  if(key == 'w' || key == 'W') {
    upL = false;
  }
  
  if(key == 's' || key == 'S') {
    downL = false;
  }
  if(keyCode == UP) {
    upR = false;
  }
  
  if(keyCode == DOWN) {
    downR = false;
  }
}