/*----------------------------------- 
 Hidden Game
 
 Written by Becky Stewart for Codasign 2015
 becky@codasign.com
 Part of Superpowers Workshops by Codasign
 
 Use the arrow keys to move Blue Booster 
 around the window. Try to find the hidden
 treasure while not hitting the baddie.
 
 This file is part of Blue Booster Hidden Game.
 
 Blue Booster Hidden Game is free software: you can redistribute it 
 and/or modify it under the terms of the GNU General Public License 
 as published by the Free Software Foundation, either version 3 of 
 the License, or (at your option) any later version.
 
 Blue Booster Hidden Game is distributed in the hope that it will 
 be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with Blue Booster Hidden Game.  If not, see 
 <http://www.gnu.org/licenses/>.
 */

PImage setting;
PImage treasure;
PImage baddie;

// location of treasure
int treasureX = 140;
int treasureY = 80;

// location of baddie
int baddieX = 500;
int baddieY = 80;

BlueBooster bb;

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

  // load images
  setting = loadImage("WA1988.291.jpg");
  treasure = loadImage("Alfred Jewel.png");
  baddie = loadImage("small-crab.png");

  // draw images from the centre instead of the corner
  imageMode(CENTER);

  // load a font for text
  gameFont = loadFont("ArialRoundedMTBold-48.vlw");
  textFont(gameFont, 32);
  textAlign(CENTER, CENTER);

  // don't draw outlines around the shapes
  noStroke();
}

/*----------------------------------- 
 draw function is repeatedly called
 until the window is closed
-----------------------------------*/
void draw() {
  // set the image for the background
  background(setting);

  // play game if game hasn't been won or lost
  if (!gameWon && !gameLost) {
    // check if collided with baddie
    checkGameLost(); 

    // check if won game
    checkGameWon();

    // update position of BB
    bb.update();

    // draw BB
    bb.display();
  } else {
    // the game has been won
    if ( gameWon) {
      // draw you won banner
      fill(0, 200, 0);
      rect(0, height/2-30, width, 60);
      fill(255);
      text("Game Over! You Won!", width/2, height/2);

      // reveal the treasure
      image(goal, goalX, goalY, goal.width/5, goal.height/5);
    }
    // the game has been lost
    if ( gameLost ) {
      // draw you lost banner
      fill(200, 0, 0);
      rect(0, height/2-30, width, 60);
      fill(255);
      text("Game Over. You Lost.", width/2, height/2);

      // reveal the baddie
      image(baddie, baddieX, baddieY, baddie.width/4, baddie.height/4);
    }
  }
}

/*----------------------------------- 
 decide if Blue Booster hit the treasure
-----------------------------------*/
void checkGameWon() {
  if ( bb.getX() < goalX+goal.width/5 &&
    bb.getX() > goalX-goal.width/5 &&
    bb.getY() < goalY+goal.height/5 &&
    bb.getY() > goalY-goal.height/5 ) {
    gameWon = true;
  }
}
/*----------------------------------- 
 decide if Blue Booster hit the baddie
-----------------------------------*/
void checkGameLost() {
  if ( bb.getX() < baddieX+baddie.width/4 &&
    bb.getX() > baddieX-baddie.width/4 &&
    bb.getY() < baddieY+baddie.height/4 &&
    bb.getY() > baddieY-baddie.height/4 ) {
    gameLost = true;
  }
}

