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

class Platform {
  float platX;
  float platY; 
  float platWidth;
  float platHeight;

  /*-----------------------------------  
   Constructor
   sets up new object 
   -----------------------------------*/
  Platform(float x, float y, float w, float h) {
    platX = x;
    platY = y; 
    platWidth = w;
    platHeight = h;
  }

  /*-----------------------------------  
   Display  
   draws the rect on the screen 
   -----------------------------------*/
  void display() {
    noStroke();
    fill(200, 0, 0);
    rect(platX, platY, platWidth, platHeight, 7);
  }
  
  /*-----------------------------------  
   Check Collision 
   determine if something is touching 
   the platform 
   -----------------------------------*/
  boolean checkCollision(float objX, float objY) {
    if ( objX < platX+platWidth+8 && 
         objX > platX-2 &&
         objY > platY+2 && 
         objY < platY+platHeight ) {
      return true;
    } else {
      return false;
    }
  }
  
  /*-----------------------------------  
   Get Height  
   return the height of the platform 
   -----------------------------------*/
  float getHeight() {
    return platY;
  }
}

