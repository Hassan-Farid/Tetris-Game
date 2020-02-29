//Declaring tetris as a library object
library tetris;

//Importing built-in dart packages
import 'dart:html';
import 'dart:async';
import 'dart:math';

//Including scripts containing the logical structure of the tetris game
//Each part describes a different element used in the game
part 'src/model/tile.dart';
part 'src/model/block.dart';
part 'src/model/blocks.dart';
part 'src/model/game.dart';