/*This file is part of Blue Booster Hidden Game.
 
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

class BlueBooster {
  float x;
  float y;
  PImage sprite;
  float spriteWidth;
  float spriteHeight;

  /*-----------------------------------  
   Constructor
   sets up new object 
   -----------------------------------*/
  BlueBooster() {
    imageMode(CENTER);
    sprite = loadImage("BB_RUN1.png"); 
    x = 100;
    y = height/2;
    spriteWidth = sprite.width * 0.5;
    spriteHeight = sprite.height * 0.5;
  }

  /*----------------------------------- 
   Update
   moves BB with key presses
   adds in gravity 
   -----------------------------------*/
  void update() {
    // check if key is pressed
    if ( keyPressed ) {
      if ( key == CODED ) {
        // move left
        if ( keyCode == LEFT ) {
          x-=2;
        }
        // move right
        if ( keyCode == RIGHT ) {
          x+=2;
        }
        // move up
        if ( keyCode == UP ) {
          y-=2;
        }
        // move down
        if ( keyCode == DOWN ) {
          y+=2;
        }
      }
    }
  }

  /*-----------------------------------  
   Display  
   draws the sprite on the screen 
   -----------------------------------*/
  void display() {
    image(sprite, x, y, spriteWidth, spriteHeight);
  }

  /*----------------------------------- 
   Get X Position 
   returns current x position of sprite 
   -----------------------------------*/
  float getX() {
    return x-5;
  }

  /*----------------------------------- 
   Get Y Position 
   returns current y position of sprite
  -----------------------------------*/
  float getY() {
    return y + spriteHeight/2;
  }
}

