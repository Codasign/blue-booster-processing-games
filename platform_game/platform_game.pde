/*----------------------------------- 
 Blue Booster Platform Game
 
 Written by Becky Stewart for Codasign 2015
 becky@codasign.com
 Part of Superpowers Workshops by Codasign
 
 Use the arrow keys to move Blue Booster 
 around the window. Try to find the hidden
 treasure while not hitting the baddie.
 
 This file is part of Blue Booster Hidden Game.
 
 Blue Booster Platform Game is free software: you can redistribute it 
 and/or modify it under the terms of the GNU General Public License 
 as published by the Free Software Foundation, either version 3 of 
 the License, or (at your option) any later version.
 
 Blue Booster Platform Game is distributed in the hope that it will 
 be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with Blue Booster Hidden Game.  If not, see 
 <http://www.gnu.org/licenses/>.
 */
 
PImage setting;
PImage goal;
int goalX = 140;
int goalY = 80;
BlueBooster bb;
Platform plat1, plat2, plat3, plat4;

Baddie myBaddie;

PFont gameFont;

boolean gameWon = false;
boolean gameLost = false;

/*----------------------------------- 
 setup is run only once when the
 sketch first starts
-----------------------------------*/
void setup() {
  size(640, 465);
  bb = new BlueBooster();
  plat1 = new Platform(460, 290, 100, 20);
  plat2 = new Platform(330, 400, 100, 20);
  plat3 = new Platform(280, 200, 100, 20);
  plat4 = new Platform(90, 140, 100, 20);

  myBaddie = new Baddie(width-150, 50);

  setting = loadImage("WA1988.291.jpg");
  goal = loadImage("Alfred Jewel.png");
  imageMode(CENTER);

  gameFont = loadFont("ArialRoundedMTBold-48.vlw");
  textFont(gameFont, 32);
  textAlign(CENTER, CENTER);
}

/*----------------------------------- 
 draw function is repeatedly called
 until the window is closed
-----------------------------------*/
void draw() {
  background(setting);
  // draw goal
  image(goal, goalX, goalY, goal.width/5, goal.height/5);
  if (!gameWon && !gameLost) {
    // check if BB on platforms
    if ( plat1.checkCollision(bb.getX(), bb.getY() )) {
      // if on platform, set where gravity stops
      bb.setGround(plat1.getHeight());
    } else if ( plat2.checkCollision(bb.getX(), bb.getY() )) {
      // if on platform, set where gravity stops
      bb.setGround(plat2.getHeight());
    } else if ( plat3.checkCollision(bb.getX(), bb.getY() )) {
      // if on platform, set where gravity stops
      bb.setGround(plat3.getHeight());
    } else if ( plat4.checkCollision(bb.getX(), bb.getY() )) {
      // if on platform, set where gravity stops
      bb.setGround(plat4.getHeight());
    } else {
      // set bottom of screen back to ground
      bb.setGround(height);
    }
    
    // check if collided with baddie
    if (myBaddie.checkCollision(bb.getX(), bb.getY()) ) {
     gameLost = true; 
    }
    // check if won game
    checkGameWon();
    
    // update position of BB
    bb.update();

    // update position of baddie
    myBaddie.update();

    // draw platforms
    plat1.display();
    plat2.display();
    plat3.display();
    plat4.display();

    // draw baddie
    myBaddie.display();

    // draw BB
    bb.display();
  } else {
    if ( gameWon) {
      fill(0, 200, 0);
      rect(0, height/2-30, width, 60);
      fill(255);
      text("Game Over! You Won!", width/2, height/2);
    }
    if ( gameLost ) {
      fill(200, 0, 0);
      rect(0, height/2-30, width, 60);
      fill(255);
      text("Game Over! You Lost", width/2, height/2);
    }
  }
}


/*----------------------------------- 
 decide if Blue Booster reached the goal
-----------------------------------*/
void checkGameWon() {
  if ( bb.getX() < goalX+goal.width/5 &&
    bb.getX() > goalX-goal.width/5 &&
    bb.getY() < goalY+goal.height/5 &&
    bb.getY() > goalY-goal.height/5 ) {
    gameWon = true;
  }
}

