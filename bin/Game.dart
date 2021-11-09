import 'Board.dart';
import 'Operator.dart';
import 'Player.dart';
import 'dart:io';

class Game with Manage, ManageProperty, Dice {
  var board = Board();
  void StartGame() {
    board.art.clearConsole();
    board.art.monopoly();
    board.art.welcome();
    board.art.displayRule();
    var input = getInputYN('Are you want to start the game?[Y,N] :');
    if (input == 'Y') {
      var playerName = getInput(
          'Please enter your name(Player 1(your name must be in range 1-5 alphabet)) :');
      var player1 = Player(playerName.toString(), 10000000);
      playerName = getInput(
          'Please enter your name(Player 2(your name must be in range 1-5 alphabet)) :');
      var player2 = Player(playerName.toString(), 10000000);
      board.getBoard()[0].addCurrentPlayer(player1);
      board.getBoard()[0].addCurrentPlayer(player2);
      displayPlayerDetail(player1, board);
      displayPlayerDetail(player2, board);
      sleep(Duration(seconds: 3));
      StartMonopoly(player1, player2);
    } else {
      return;
    }
  }

  void StartMonopoly(Player player1, Player player2) {
    var player = <Player>[player1, player2];
    for (var i = 0;; i++) {
      var turn = i % 2;
      if (checkWin(player[turn.floor()], player[1]) == 1) {
        print('${player1.getName()} win!!');
        break;
      } else if (checkWin(player[turn.floor()], player[1]) == 2) {
        print('${player2.getName()} win!!');
        break;
      } else {
        if (player[turn.floor()].getStopStatus() > 0) {
          print(
              'Player ${player[turn.floor()].getName()} has been jail!(Turn remaining ${player[turn.floor()].getStopStatus()})');
          player[turn.floor()]
              .setStopStatus(player[turn.floor()].getStopStatus() - 1);
          continue;
        }
        print(
            'Turn Player ${player[turn.floor()].getName()} press enter to continue!...');
        // ignore: unused_local_variable
        var stop = stdin.readLineSync();
        board.move(getDice(board), player[turn.floor()], board);
        if (checkPosition(player[turn.floor()])) {
          updatePlayer(player[turn.floor()], board, board.getPowercard());
          continue;
        }
        if (!checkPropertyOccupied(player[turn.floor()], board)) {
          if (turn.floor() == 1) {
            buyProperty(
                player[turn.floor()], player[turn.floor() - 1], board, 1);
            art.displayTable(board);
            displayPlayerDetail(player[0], board);
            displayPlayerDetail(player[1], board);
          } else {
            buyProperty(
                player[turn.floor()], player[turn.floor() + 1], board, 1);
            art.displayTable(board);
            displayPlayerDetail(player[0], board);
            displayPlayerDetail(player[1], board);
          }
        } else {
          if (checkPropertyOwner(player[turn.floor()], board)) {
            if (board
                    .getBoard()[player[turn.floor()].getPosition()]
                    .getCurrentLevel() ==
                4) {
              print('This property is already upgrade all assets.');
              art.displayTable(board);
              displayPlayerDetail(player[0], board);
              displayPlayerDetail(player[1], board);
            } else {
              if (turn.floor() == 1) {
                buyProperty(
                    player[turn.floor()], player[turn.floor() - 1], board, 2);
                art.displayTable(board);
                displayPlayerDetail(player[0], board);
                displayPlayerDetail(player[1], board);
              } else {
                buyProperty(
                    player[turn.floor()], player[turn.floor() + 1], board, 2);
                art.displayTable(board);
                displayPlayerDetail(player[0], board);
                displayPlayerDetail(player[1], board);
              }
            }
          } else {
            calculateVisitorPriceAndPlayerMoney(player[turn.floor()], board);
            if (turn.floor() == 1) {
              buyProperty(
                  player[turn.floor()], player[turn.floor() - 1], board, 3);
              displayPlayerDetail(player[0], board);
              displayPlayerDetail(player[1], board);
            } else {
              buyProperty(
                  player[turn.floor()], player[turn.floor() + 1], board, 3);
              displayPlayerDetail(player[0], board);
              displayPlayerDetail(player[1], board);
            }
          }
        }
      }
    }
  }
}
