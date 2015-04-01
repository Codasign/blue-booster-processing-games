/*This file is part of Blue Booster Platform Game.
 
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
 
class Baddie {
  PImage baddieImage;
  float bWidth, bHeight;
  float xPos, yPos;
  float xDir = -1.3;
  float yDir = 3.5;


  /*-----------------------------------  
   Constructor
   sets up new object 
   -----------------------------------*/
  Baddie(float x, float y) {
    baddieImage = loadImage("small-crab.png");
    xPos = x;
    yPos = y;

    bWidth = baddieImage.width/2;
    bHeight = baddieImage.height/2;
  }

  void update() {
    xPos = xPos + xDir;
    yPos = yPos + yDir;

    // if hitting the right side
    if ( xPos > width-bWidth/2 ) {
      xDir = -1*xDir;
    }
    // if hitting the left side
    if ( xPos < bWidth/2 ) {
      xDir = -1*xDir;
    }
    // if hitting the top
    if ( yPos > height-bHeight/2 ) {
      yDir = -1*yDir;
    }
    // if hitting the bottom
    if ( yPos < bHeight/2 ) {
      yDir = -1*yDir;
    }
  }

  /*-----------------------------------  
   Display  
   draws the sprite on the screen 
   -----------------------------------*/
  void display() {
    image(baddieImage, xPos, yPos, bWidth, bHeight);
  }

  /*-----------------------------------  
   Check Collision 
   determine if something is touching 
   the baddie 
   -----------------------------------*/
  boolean checkCollision(float objX, float objY) {
    if ( objX < xPos+bWidth/2+10 && 
      objX > xPos-bWidth/2-10 &&
      objY > yPos-bHeight/2-10 && 
      objY < yPos+bHeight/2+10 ) {
      return true;
    } else {
      return false;
    }
  }
}

