//Declaring this file as a part of library tetris
part of tetris;

//Extending the Block class by adding some functionalitites to create the IBlock class
class IBlock extends Block{
  //Declaring the geometry of the IBlock in the game
  IBlock(int width){
    tiles[0] = Tile((width /2 - 2).floor(), -1);
    tiles[1] = Tile((width /2 - 1).floor(), -1);
    tiles[2] = Tile((width /2).floor(), -1);
    tiles[3] = Tile((width /2 + 1).floor(), -1);
    //Rotation of the block will take place along the first tile
    rotationTile = tiles[0];
    //Color of the block will be Cyan
    color = 'cyan';
  }
}

//Extending the Block class by adding some functionalitites to create the OBlock class
class OBlock extends Block{
  //Declaring geometry of the OBlock in the game
  OBlock(int width){
    tiles[0] = Tile((width /2).floor(), -1);
    tiles[1] = Tile((width /2 + 1).floor(), -1);
    tiles[2] = Tile((width /2).floor(), 0);
    tiles[3] = Tile((width /2 + 1).floor(), 0);
    //Rotation of the block will take place along the second tile
    rotationTile = tiles[1];
    //Color of the block will be Yellow
    color = 'yellow';
  }
}

//Extending the Block class by adding some functionalitites to create the JBlock class
class JBlock extends Block{
  //Declaring the geometry of the JBlock in the game
  JBlock(int width){
    tiles[0] = Tile((width /2 - 1).floor(), 0);
    tiles[1] = Tile((width /2).floor(), 0);
    tiles[2] = Tile((width /2 + 1).floor(), 0);
    tiles[3] = Tile((width /2 - 1).floor(), -1);
    //Rotation of the block will take place along the second tile
    rotationTile = tiles[1];
    //Color of the block will be Blue
    color = 'blue';
  }
}

//Extending the Block class by adding some functionalitites to create the LBlock class
class LBlock extends Block{
  //Decalring the geometry of the LBlock in the game
  LBlock(int width){
    tiles[0] = Tile((width /2 - 1).floor(), 0);
    tiles[1] = Tile((width /2).floor(), 0);
    tiles[2] = Tile((width /2 + 1).floor(), 0);
    tiles[3] = Tile((width /2 + 1).floor(), -1);
    //Rotation of the block will take place along the second tile
    rotationTile = tiles[1];
    //Color of the block will be Orange
    color = 'orange';
  }
}

//Extending the Block class by adding some functionalitites to create the TBlock class
class TBlock extends Block{
  //Declaring the geometry of the TBlock in the game
  TBlock(int width){
    tiles[0] = Tile((width /2 - 1).floor(), 0);
    tiles[1] = Tile((width /2).floor(), 0);
    tiles[2] = Tile((width /2 + 1).floor(), 0);
    tiles[3] = Tile((width /2).floor(), -1);
    //Rotation of the block will take place along the second tile
    rotationTile = tiles[1];
    //Color of the block will be Purple
    color = 'purple';
  }
}

//Extending the Block class by adding some functionalitites to create the ZBlock class
class ZBlock extends Block{
  //Declaring the geometry of the ZBlock in the game
  ZBlock(int width){
    tiles[0] = Tile((width /2 - 1).floor(), 0);
    tiles[1] = Tile((width /2).floor(), 0);
    tiles[2] = Tile((width /2).floor(), -1);
    tiles[3] = Tile((width /2 + 1).floor(), -1);
    //Rotation of the block will take place along the second tile
    rotationTile = tiles[1];
    //Color of the block will be Red
    color = 'red';
  }
}

//Extending the Block class by adding some functionalitites to create the SBlock class
class SBlock extends Block{
  //Declaring the geometry of the SBlock in the game
  SBlock(int width){
    tiles[0] = Tile((width /2 - 1).floor(), -1);
    tiles[1] = Tile((width /2).floor(), -1);
    tiles[2] = Tile((width /2).floor(), 0);
    tiles[3] = Tile((width /2 + 1).floor(), 0);
    //Rotation of the block will take place along the second tile
    rotationTile = tiles[1];
    //Color of the block will be Green
    color = 'green';
  }
}