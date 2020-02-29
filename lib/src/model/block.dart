//Declaring this file as a part of the library tetris
part of tetris;

//Declaring the class for a particular block
class Block{
  //Block will comprise of 4 tiles
  List<Tile> tiles = List<Tile>(4);
  //Block can be rotated on the basis of tile input passed, which would rotate the whole block about its axis
  Tile rotationTile;
  //Declaring string to indicate the color of the Block
  String color;

  //Method to move block around the screen: Takes the direction we want to move to as argument
  //We move each tile in the tiles list one by one along the direction passed as arguments, thus, the whole block moves in that particular direction
  void move(String direction){
    switch(direction){
      case 'right':
        //For right, we move -1 in horizontal direction since right represents the -X-axis
        tiles.forEach((t) => t.x -= 1);
        break;
      case 'left':
        //For left, we move 1 in horizontal direction since left represents the X-axis
        tiles.forEach((t) => t.x += 1);
        break;
      case 'up':
        //For up, we move -1 in vertical direction since up represents the -Y-axis
        tiles.forEach((t) => t.y -= 1);
        break;
      case 'down':
        //For down, we move 1 in vertical direction since down represents the Y-axis
        tiles.forEach((t) => t.y += 1);
        break;
    }
  }

  //Method to adjust geometry of tile when rotated towards right
  rotateRight(){
    //For given tile list, the new position of each tile can be assigned using the formulae stated
    tiles.forEach((tile) {
      num x = tile.x;
      tile.x = rotationTile.x - tile.y + rotationTile.y;
      tile.y = rotationTile.y + x - rotationTile.x;
    });
  }

  //e.g. we have the coordiantes of the tile as (0,1),(1,1),(2,1),(3,1) then using the rotation right we get:
  //Suppose we are rotating the tile about (1,1) then we have:
  //(1-1+1, 1+0-1), (1-1+1,1+1-1), (1-1+1,1+2-1), (1-1+1,1+3-1) => (1,0),(1,1),(1,2),(1,3) which are required coordinates

  //Peforms same function as rotateRight except in the opposite direction 
  rotateLeft(){
    tiles.forEach((tile) {
      num x = tile.x;
      tile.x = rotationTile.x + tile.y - rotationTile.y;
      tile.y = rotationTile.y - x + rotationTile.x;
    });
  }
}