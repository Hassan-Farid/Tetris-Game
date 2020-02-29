//Declaring this file as a part of the tetris library
part of tetris;

//Creating the Game class containing the attributes and methods for the Tetris Game
class Game{
  //Declaring CanvasElement for the board where the game is to be played
  CanvasElement board;
  //Declaring the Element for showing the game score/ points earned 
  Element gameScore;
  //Declaring a Block which will serve as the particular block on the screen at an instance
  Block currentBlock;

  //Initializing the geometry of the board
  static int height = 10;
  static int width = 20;
  static int cellSize = 30;

  //Initializing counter for points earned (since the points are as many as lines cleared by the user)
  static int linesCleared;
  //Initializing CanvasRenderingContext2D object to render the changes on the board like displaying the elements left on the board after clearing a line
  static CanvasRenderingContext2D ctx;

  //Declaring variables responsible for state changes in the game

  //Board of the game is composed of a grid containing the rows and columns values
  //Initially we will put 0s for every empty cell in the grid
  //As soon as a block fills a certain cell in the grid, it will change its value to 1
  //These lists will contain the values for the changes that are being made to the state of the board using the blocks 
  static List<List<int>> boardState;

  //Row on the board of the game is composed of values initially containing all 0s
  //This list will be filled by 1 as soon as the blocks cover the cells in the row
  //This will help in removing those rows in which all values have turned to 1
  static List<int> rowState;

  //Defining the game constructor
  Game(){
    //Initializing the score
    linesCleared = 0;
    //Assigning the div id to the game score Element
    gameScore = Element.div()..id = 'score';

    //Initialzing the rowState with 0s
    rowState = List<int>.filled(height, 0);
    //Initializing the boardState with 0s
    boardState = List<int>(width).map((_) => List<int>.filled(height,0),).toList();
  }

  //The game would get more exciting with a random number of block entering everytime
  //Thus, we would want a random from 7 digits which would decide whether a I/O/J/L/T/Z/S Block will show as the curretBlock
  Block getRandomPiece(){
    num randomInt = Random().nextInt(7);
    //We have used switch case to declare the block type on the basis of the random number recieved
    switch(randomInt){
      case 0:
        return IBlock(width);
      case 1:
        return OBlock(width);
      case 2:
        return JBlock(width);
      case 3:
        return TBlock(width);
      case 4:
        return LBlock(width);
      case 5:
        return ZBlock(width);
      case 6:
        return SBlock(width);
    }

    //Since the function is of block type, we have returned a Block object, in reality though, the method 
    //will never reach this part of the code since it would have already returned a block value for the specified random number
    return Block();
  }

  //Defining a method to clear the rows if all elements turn 1
  void clearRows(){
    //Storing each row element in a num type row object
    for (num idx = 0; idx < rowState.length; idx++){
      num row = rowState[idx];

      //In case the row becomes equal to width, i.e. gets completely filled we use the imageData object to remove the last row which has completely turned 1 from the board canvas
      if (row == width){
        ImageData imageData = ctx.getImageData(0, 0, cellSize * width, cellSize * idx);
        ctx.putImageData(imageData, 0, cellSize);

        //Removing the completely filled row from both the rowState and boardState
        //Thus, the row will be removed and the second last row will now become the last row
        for (int y = idx; y > 0; y--){
          for (int x = 0; x < width; x++){
            boardState[x][y] = boardState[x][y-1];
          }
          rowState[y] = rowState[y-1];
        }

        //Reinitializing the rowState to 0s and boardState to 0s
        rowState[0] = 0;
        boardState.forEach((c) => c[0] = 0);

        //Incrementing the score 
        linesCleared++;
      }
    }
  }

  //Method to check if the move made is valid or not
  bool validMove(){
    //In any of the above cases the move would be clearly invalid, thus returning false bool in these cases otherwise true
    for (Tile tile in currentBlock.tiles){
      if (tile.x >= width || tile.x < 0 || tile.y < 0 || tile.y >= height || boardState[tile.x][tile.y] == 1){
        return false;
      }
    }
    return true;
  }

  //Method to handle the movement of the piece
  bool pieceMoving(String s){
    //Assuming the piece is indeed moving
    bool pieceIsMoving = true;

    //Initializing the board color with gray so that movement of the pieces are visible
    ctx.fillStyle = 'grey';

    //Representing the block on the board
    currentBlock.tiles.forEach((Tile tile){
      ctx.fillRect(tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    });

    //If the user rotates then the block rotates right otherwise it keeps on moving in the same direction
    if (s == 'rotate'){
      currentBlock.rotateRight();
      }
    else{
      currentBlock.move(s);
    }

    //Picking up the cases in case of invalid moves: During opposite direction
    //Like if the piece is invalid to move left then on pressing hte rotate it will rotate right instead of left and so on..
    if (!(pieceIsMoving = validMove())){
      if (s == 'rotate') currentBlock.rotateLeft();
      if (s == 'left') currentBlock.move('right');
      if (s == 'right') currentBlock.move('left');
      if (s == 'up') currentBlock.move('down');
      if (s == 'down') currentBlock.move('up');
    }

    //We will use the color of the current block to show on the screen
    //Suppose a cyan block is falling we will show it by changing the color from gray to cyan on the cells on which the piece will fall
    ctx.fillStyle = currentBlock.color;

    //For each tile of the current block, we will fill the gray board with the color of their tiles
    currentBlock.tiles.forEach((tile){
      ctx.fillRect(tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    });

    //To tell that the piece is indeed moving
    return pieceIsMoving;
  }

  //Method to update the game on the basis of timer
  //The timer object tells after what time will the screen refresh
  void updateGame(Timer timer){

    //For each update, the game score elemnent will show either the old score or the modified score
    gameScore.setInnerHtml('<p>Score: ${linesCleared} Lines </p>',);
    
    //In case the piece has stopped moving down i.e. it is has reached bottom of screen
    //We will assign all the cell values covered by it to 1
    if (!(pieceMoving('down'))){
      currentBlock.tiles.forEach((t){
        boardState[t.x][t.y] = 1;
        rowState[t.y]++;
      });
      
      //Clear Rows will remove the bottom row if it has been completely filled
      //Otherwise will not perform any functionality
      clearRows();

      //Once the clear row is performed, a new block will be generated on the screen
      currentBlock = getRandomPiece();

      //Finally we define a condition to make sure that if the game crashes it will automatically stop working
      if (!pieceMoving('down')){
        timer.cancel();
      }
    } 
  }

  //Method to initialize the value of the board canvas
  void initializeCanvas(){
    //Declaring the geometry and features/attributes of the board to use
    board = Element.html('<canvas/>');
    board.width = width * cellSize;
    board.height = height * cellSize;
    ctx = board.context2D;

    ctx.fillStyle = 'grey';
    ctx.fillRect(0,0,board.width,board.height);
  }

  //Method to handle the input from the keyboard
  void handleKeyboard(Timer timer){
    //Checks what key has been pressed and performs the passed method on its basis as an event callback
    document.onKeyDown.listen((event){
      if (timer.isActive){
        //For left key, piece will move left
        if(event.keyCode == 37) pieceMoving('left');
        //For up key, piece will rotate
        if(event.keyCode == 38) pieceMoving('rotate');
        //For right key piece will mvoe right
        if(event.keyCode == 39) pieceMoving('right');
        //For down key piece will move down
        if(event.keyCode == 40) pieceMoving('down');
        //For space bar, piece will touch the bottom of itself
        if(event.keyCode == 32) while (pieceMoving('down')) {}
      }
    });
  }

  //Method to start the game
  void start(){
    //Calling method to initialize the board canvas
    initializeCanvas();

    //Get values stored in div i.e. output 
    Node entryPoint = querySelector('#output');

    //Store the board and gamescore inside the output shown as div
    entryPoint.nodes.add(board);
    entryPoint.nodes.add(gameScore);

    //Declaring the timer value i.e. the game will get refreshed/updated after every 500 milliseconds
    Timer timer = Timer.periodic(Duration(milliseconds: 500), updateGame,);

    //Get random piece as the current block
    currentBlock = getRandomPiece();
    //Handle keyboard method during the game if timer is active
    handleKeyboard(timer);
  }
} 