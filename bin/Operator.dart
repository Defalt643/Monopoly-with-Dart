import 'dart:core';
import 'dart:io';
import 'Board.dart';
import 'Player.dart';
import 'dart:math';
import 'AsciiArt.dart';
import 'PowerCard.dart';

abstract class Operator {}

mixin Manage {
  AsciiArt art = AsciiArt();
  int checkWin(Player player1, Player player2) {
    if (player1.getMoney() <= 0) {
      return 2;
    } else if (player2.getMoney() <= 0) {
      return 1;
    }
    return -1;
  }

  void displayPlayerDetail(Player player, Board board) {
    print(
        '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
    print(
        ' Player name : ${player.getName()}\n Player balance : ${player.getMoney()}');
    stderr.write(' Player property : [');
    for (var i = 0; i < player.getOccupied().length; i++) {
      if (i == player.getOccupied().length - 1) {
        stderr.write(board.getBoard()[player.getOccupied()[i]].getName());
      } else {
        stderr.write(
            board.getBoard()[player.getOccupied()[i]].getName().toString() +
                ' , ');
      }
    }
    stderr.write(']');
    print(
        '\n┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
  }

  int random(int max, int min) {
    final rnd = Random();
    return min + rnd.nextInt((max + 1) - min);
  }

  void move(int amount, Player player, Board board) {
    art.displayTable(board);
    sleep(Duration(milliseconds: 300));
    var excess = 0;
    if (amount + player.getPosition() > 29) {
      excess = amount + player.getPosition() - 29;
      amount = amount - excess;
    }
    while (true) {
      if (amount == 0 && excess == 0) {
        break;
      } else if (amount > 0) {
        art.clearConsole();
        board.getBoard()[player.getPosition()].removeCurrentPlayer(player);
        player.setPosition(player.getPosition() + 1);
        board.getBoard()[player.getPosition()].addCurrentPlayer(player);
        art.displayTable(board);
        amount--;
      } else if (excess != 0) {
        amount += excess - 1;
        board.getBoard()[player.getPosition()].removeCurrentPlayer(player);
        player.setPosition(0);
        board.getBoard()[0].addCurrentPlayer(player);
        art.displayTable(board);
        excess = 0;
        print('You received salary 2M');
        player.addMoney(2000000);
        sleep(Duration(seconds: 5));
      }
      sleep(Duration(milliseconds: 300));
    }
  }

  String getInput(String dialog) {
    while (true) {
      stderr.write(dialog);
      var input = stdin.readLineSync();
      if (input!.isEmpty) {
        print('Input must be not null. Please try again!');
        continue;
      } else {
        if (input.length > 5) {
          print('Your input are too long!!. Please try again!');
          continue;
        }
        return input;
      }
    }
  }

  String getInputYN(String dialog) {
    while (true) {
      stderr.write(dialog);
      var input = stdin.readLineSync();
      if (input!.isEmpty) {
        print('Input must be not null. Please try again!');
        continue;
      } else {
        if (input.length >= 2) {
          print('Your input are too long!!. Please try again!');
          continue;
        } else if (input == 'N') {
          return input;
        } else if (input == 'Y') {
          return input;
        } else {
          print('Your input are must be [Y/N] only!!. Please try again!');
        }
      }
    }
  }

  void displayPlayerStatus(Player player) {
    print(
        'Player name : ${player.getName()}\nCurrent balance : ${player.getMoney()}\nCurrent occupied : ${player.getOccupied()}');
    print(
        'Current position : ${player.getPosition()}\nStop Status : ${player.getStopStatus()} turn');
  }

  int getInputTravel(String dialog, int min, int max) {
    while (true) {
      stderr.write(dialog);
      var input;
      try {
        input = int.parse(stdin.readLineSync()!);
      } on FormatException {
        print('Input must be a number and not null. Please try again!');
        continue;
      }
      var digit = input;
      if (digit > max + 1 || digit < min - 1) {
        print('Input must be in range $min to ${max + 1} Please try again.');
        continue;
      }
      return digit;
    }
  }

  void travel(Player player, Board board) {
    var position = getInputTravel(
        'You got powercard that can travel you to anywhere in this board! Where you want to go?[1-30] : ',
        1,
        30);
    if (position > player.getPosition() + 1) {
      move((30 - -player.getPosition()) + position - 1, player, board);
    } else {
      move((board.getBoard().length - player.getPosition()) - position, player,
          board);
    }
  }

  void updatePlayer(Player player, Board board, List<PowerCard> powercard) {
    var index = random(powercard.length - 1, 0);
    if (player.getPosition() == 0) {
      player.addMoney(2000000);
    } else if (player.getPosition() == 7) {
      print('Player ${player.getName()} has been jail for 3 turn!!!');
      player.setStopStatus(3);
    } else if (player.getPosition() == 11) {
      print(
          'You got powercard[${powercard[index].getName}]\nEffect name : ${powercard[index].getEffectName}');
      if (powercard[index].getTravelPosition != -1) {
        return travel(player, board);
      }
      player.effectPowerCardToPlayer(powercard[index], board);
      displayPlayerStatus(player);
    } else if (player.getPosition() == 15) {
      travel(player, board);
    } else if (player.getPosition() == 22) {
      print(
          'Player ${player.getName()} has been move to jail and stop for 3 turn!!!');
      player.setStopStatus(3);
      move(15, player, board);
    } else if (player.getPosition() == 26) {
      print(
          'You got powercard[${powercard[index].getName}]\nEffect name : ${powercard[index].getEffectName}');
      player.effectPowerCardToPlayer(
          powercard[random(0, powercard.length - 1)], board);
      displayPlayerStatus(player);
    }
  }

  bool checkPosition(Player player) {
    if (player.getPosition() == 0) {
      return true;
    } else if (player.getPosition() == 7) {
      return true;
    } else if (player.getPosition() == 11) {
      return true;
    } else if (player.getPosition() == 15) {
      return true;
    } else if (player.getPosition() == 22) {
      return true;
    } else if (player.getPosition() == 26) {
      return true;
    }
    return false;
  }
}
mixin ManageProperty {
  int getInputDigit(String dialog, int min, int max) {
    while (true) {
      stderr.write(dialog);
      var input;
      try {
        input = int.parse(stdin.readLineSync()!);
      } on FormatException {
        print('Input must be a number and not null. Please try again!');
        continue;
      }
      var digit = input;
      if (digit > max + 1 || digit < min - 1) {
        print('Input must be in range $min to ${max + 1} Please try again.');
        continue;
      }
      return digit;
    }
  }

  bool checkPropertyOccupied(Player player, Board board) {
    if (board.getBoard()[player.getPosition()].getOccupied() == 'None') {
      return false;
    }
    return true;
  }

  void takeOverProperty(Player buyer, Player seller, Board board) {
    print('[1] takeover this property\n[2]Skip');
    var input = getInputDigit(
        'Are you want to take over on this property.[${board.getBoard()[buyer.getPosition()].getName()}]',
        1,
        2);
    if (input == 1) {
      buyer.reduceMoney(
          board.getBoard()[buyer.getPosition()].getVisitorPrice() * 1.5);
      seller.addMoney(
          board.getBoard()[buyer.getPosition()].getVisitorPrice() * 1.5);
      print(
          'Successfully take over on ${board.getBoard()[buyer.getPosition()].getName()}');
      board.getBoard()[buyer.getPosition()].setOccupied(buyer);
      seller.removeOccupied(buyer.getPosition());
      buyer.addOccupied(buyer.getPosition());
    } else {
      print('skipped');
    }
    sleep(Duration(seconds: 5));
  }

  void buyProperty(Player player, Player player2, Board board, int type) {
    var dialog = ['Buy Land', 'Buy Pension', 'Buy Condo', 'Buy Hotel'];
    var currentPropertyLevel =
        board.getBoard()[player.getPosition()].getCurrentLevel();
    if (player.getMoney() <
        board.getBoard()[player.getPosition()].getVisitorPrice()) {
      print(
          'Sorry can\'t buy this property because your current balance are less than this property price!.');
      return;
    }
    if (type == 1) {
      print(
          'This Property are not occupied!. You can buy this property.[${board.getBoard()[player.getPosition()].getName()}]');
    } else if (type == 2) {
      print(
          'This Property are occupied by you!. You can buy upgrade on this property.[${board.getBoard()[player.getPosition()].getName()}]');
    } else {
      if (player.getMoney() >
          board.getBoard()[player.getPosition()].getVisitorPrice() * 1.5) {
        print(
            'This Property are occupied by another player!. you can take over on this property.[${board.getBoard()[player.getPosition()].getName()}]');
        return takeOverProperty(player, player2, board);
      }
      print(
          'This Property are occupied by another player!. But you can\'t takeover on this property because you haven\'t enough money${board.getBoard()[player.getPosition()].getVisitorPrice() * 1.5}.[${board.getBoard()[player.getPosition()].getName()}]');
      return;
    }
    var propertyLevel =
        board.getBoard()[player.getPosition()].getCurrentLevel();
    int buyLevel;
    while (true) {
      if (propertyLevel == 1) {
        for (var i = 0; i < 3; i++) {
          if (player.getMoney() <
              board.getBoard()[player.getPosition()].getUpgradePrice()[i]) {
            print(
                '[${i + 1}]${dialog[i]} = ${board.getBoard()[player.postition].upgradePrice[i]}\$ [You haven\'t enough moeny to buy this upgrade!]');
          } else {
            print(
                '[${i + 1}]${dialog[i]} = ${board.getBoard()[player.postition].upgradePrice[i]}\$');
          }
        }
        print('[4]Skip');
      } else if (propertyLevel == 2) {
        for (var i = 1; i < 3; i++) {
          if (player.getMoney() <
              board.getBoard()[player.getPosition()].getUpgradePrice()[i]) {
            print(
                '[${i + 1}]${dialog[i]} = ${board.getBoard()[player.postition].upgradePrice[i]}\$ [You haven\'t enough moeny to buy this upgrade!]');
          } else {
            print(
                '[${i + 1}]${dialog[i]} = ${board.getBoard()[player.postition].upgradePrice[i]}\$');
          }
        }
        print('[3]Skip');
      } else {
        print(
            '[1]${dialog[2]} = ${board.getBoard()[player.postition].upgradePrice[2]}\$');
        print('[2]Skip');
      }
      // ignore: omit_local_variable_types
      buyLevel = getInputDigit(
          'Please select level that you want to buy on ${board.getBoard()[player.getPosition()].getName()}:',
          1,
          4 - propertyLevel);
      if (buyLevel == 5 - propertyLevel) {
        print('Skipped');
        return;
      }
      if (board.getBoard()[player.getPosition()].getUpgradePrice()[buyLevel +
              board.getBoard()[player.getPosition()].getCurrentLevel() -
              2] >
          player.getMoney()) {
        print(
            'Sorry, You can\'t buy this upgrade because you haven\'t enough money!');
      } else {
        break;
      }
    }
    board.getBoard()[player.getPosition()].setOccupied(player);
    board
        .getBoard()[player.getPosition()]
        .setCurrentLevel(currentPropertyLevel + buyLevel);
    player.reduceMoney(board
        .getBoard()[player.getPosition()]
        .getUpgradePrice()[currentPropertyLevel + buyLevel - 2]);
    player.addOccupied(player.getPosition());
    print(
        'buy property[${board.getBoard()[player.getPosition()].getName()}] succesfully on level $buyLevel from player ${player.getName()}!');
    sleep(Duration(seconds: 5));
  }

  bool checkPropertyOwner(Player player, Board board) {
    if (player.getName() ==
        board.getBoard()[player.getPosition()].getOccupied()) {
      return true;
    }
    return false;
  }

  void calculateVisitorPriceAndPlayerMoney(Player player, Board board) {
    player
        .reduceMoney(board.getBoard()[player.getPosition()].getVisitorPrice());
    print(
        '${player.getName()} paid ${board.getBoard()[player.getPosition()].getVisitorPrice()}\$ for visiting this property.[${board.getBoard()[player.getPosition()].getName()}]');
    print('${player.getName()} current balance ${player.getMoney()}\$');
  }
}
mixin Dice {
  void clearConsole() {
    print("\x1B[2J\x1B[0;0H");
  }

  int getDice(Board board) {
    return _tossDice(board);
  }

  int _tossDice(Board board) {
    Random rnd;
    var art = AsciiArt();
    rnd = Random();
    var min = 1;
    var max = 6 + 1;
    var r;
    for (var i = 0; i < 10; i++) {
      sleep(Duration(milliseconds: 10 * (i * 10)));
      clearConsole();
      art.displayTable(board);
      r = min + rnd.nextInt(max - min);
      if (r == 1) {
        // ignore: prefer_single_quotes
        print(r"""\
-----
|   |
| o |
|   |
-----
    """);
      } else if (r == 2) {
        // ignore: prefer_single_quotes
        print(r"""\
-----
|o  |
|   |
|  o|
-----
    """);
      } else if (r == 3) {
        // ignore: prefer_single_quotes
        print(r"""\
-----
|o  |
| o |
|  o|
-----
    """);
      } else if (r == 4) {
        // ignore: prefer_single_quotes
        print(r"""\
-----
|o o|
|   |
|o o|
-----
    """);
      } else if (r == 5) {
        // ignore: prefer_single_quotes
        print(r"""\
-----
|o o|
| o |
|o o|
-----
    """);
      } else {
        // ignore: prefer_single_quotes
        print(r"""\
-----
|o o|
|o o|
|o o|
-----
    """);
      }
    }
    if (r == 1) {
      print('You toss a dice and get $r you will move for $r slot!.');
    } else {
      print('You toss a dice and get $r you will move for $r slots!.');
    }
    sleep(Duration(seconds: 3));
    return r;
  }
}
