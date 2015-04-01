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
 
class BlueBooster {
  float x;
  float y;
  float xDir = 0;
  float yDir = 1;
  PImage sprite;
  float spriteWidth;
  float spriteHeight;
  float ground = height;
  boolean onPlatform = false;

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
   moves Blue Booster with key presses
   adds in gravity 
   -----------------------------------*/
  void update() {
    // check if key is pressed
    if ( keyPressed ) {
      if ( key == CODED ) {
        // move left
        if ( keyCode == LEFT ) {
          x-=5;
        }
        // move right
        if ( keyCode == RIGHT ) {
          x+=5;
        }
        // move up
        if ( keyCode == UP ) {
          y-=10;
        }
      }
    }
    // account for gravity
    if ( y < ground-spriteHeight/2) {
      y= y+4;
    }
    if ( y > ground ) {
     y = ground; 
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
  
  /*----------------------------------- 
   Set Ground 
   sets where gravity stops 
   -----------------------------------*/
  void setGround(float g) {
    ground = g;
  }
}
