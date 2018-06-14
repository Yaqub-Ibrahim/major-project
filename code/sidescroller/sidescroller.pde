/**
 * sidescroller
 * by Yaqub Ibrahim
 * 
 * Sidescroller game
 * 
 */
int t=millis();
int speed= 10;
int x = 50;
int y= 809;
int level =1;
//sets up values
void setup() {
  size(1000, 1000);
  //sets up size of canvas
}

void draw() {
  if (millis()-t>= 1600) {
    y=809;

    //makes the square fall when it jumps
  }
  background(0, 255, 255);
  fill(255, 0, 0);
  rect(x, y, 40, 40);
  //the rectangle and it's colour along with the background
  fill(0, 0, 0);
  textSize(30);
  text(level, 500, 500);

  if (level ==1) {
    fill(0, 153, 0);
    rect(0, 850, 1000, 150);
    //what makes level 1
    if (x>=1000) {
      level=2;
      x=50;
      y=809;
      //sets up level 2
    }
  }


  if (level ==2)
  {
    fill(255, 0, 0);
    rect(x, y, 40, 40);
    fill(0, 153, 0);
    rect(0, 850, 500, 150);
    rect(700, 850, 500, 150);
    fill(0, 0, 0);
    rect(500, 850, 200, 150);
    if (x>=510 && x<=690 && y==809) {
      y=910;
    }
    if (y==910) {
      x=50;
      y=809;
      //what makes level 2
    }
    if (x==1000) {
      level=3;
      x=50;
      y=809;
      //sets up level 3
    }
  }
  if (level==3) {
    fill(255, 0, 0);
    rect(x, y, 40, 40);
    fill(0, 153, 0);
    rect(0, 850, 200, 150);
    rect(400, 850, 200, 150);
    rect(800, 850, 200, 150);
    fill(0, 0, 0);
    rect(200, 850, 200, 150);
    rect(600, 850, 200, 150);
    //what makes level 3
    if (x>=210 && x<=390 && y==809) {
      y=910;
    }
    if (x>=610 && x<=790 && y==809) {
      y=910;
    }
    if (y==910) {
      x=50;
      y=809;
    }
    if (x>=1000) {
      level = 4;
      x=50;
      y=809;
      //sets up level 4
    }
  } 

  if (level==4) {
    fill(255, 0, 0);
    rect(x, y, 40, 40);
    fill(0, 153, 0);
    rect(0, 850, 100, 150);
    rect(300, 850, 100, 150);
    rect(500, 850, 100, 150);
    rect(700, 850, 100, 150);
    rect(860, 850, 50, 150);
    fill(0, 0, 0);
    rect(90, 850, 210, 150);
    rect(400, 850, 110, 150);
    rect(600, 850, 110, 150);
    rect(800, 850, 70, 150);
    rect(910, 850, 100, 150);
    //what makes level 4
    if (y==910) {
      x=50;
      y=809;
    }
    if (x>=100 && x<=260 && y==809) {
      y=910;
    }

    if (x>=410 && x<=470 && y==809) {
      y=910;
    }

    if (x>=610 && x<=670 && y==809) {
      y=910;
    }

    if (x>=790 && x<=830 && y==809) {
      y=910;
    }

    if (x>=910 && x<=1000 && y==809) {
      y=910;
    }

    if (y==910) {
      x=50;
      y=809;
    }

    if (x>=1000) {
      level =5;
      x=50;
      y=809;
    }
  }
  if (level ==5) {
    fill(0, 153, 0);
    rect(0, 850, 1000, 150);
    text("CONGRADULATION YOU WON!!!!", 200, 200);
    //what makes level 5
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y=y-100;
      t = millis();
      //sets up the rectangle so it can jump and fall
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        x= x+speed;
      } else if (keyCode == LEFT) {
        x= x-speed;
      }
      //sets up the controls of the rectangle
    }
  }
}
