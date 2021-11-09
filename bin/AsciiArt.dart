import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'dart:math';

import 'Board.dart';
import 'Player.dart';

class AsciiArt {
  final console = Console();
  void displayRule() {
    var rule = [
      'Welcome to Monopoly game',
      '1.From start both player will receive 10M dollar',
      '2.If player balance below than 0 another player will win!',
      '3.you can buy any property if you have enough money',
      '4.you can takeover property from another player if your money have more than property price *1.5',
      '5.This game have 30 slot contains [Start Point , Property , Powercard , JAIL , FREE GO ANYWHERE ,GOTO JAIL]',
      '6.If you move to Powercard slot or move to slot 12 or 27 you will receive a random powercard(5 powercard in deck)',
      '7.If you move to Jail or move to slot 8 you will be jail for 3 turns (Stop playing for 3 turns)',
      '8.If you move to Free Go Anywhere or move to slot 16 you will go to anywhere in this game as you want!',
      '9.If you move to Goto Jail or slot 23 you will move to jail and will be jail for 3 turns(Stop playing for 3 turns)',
      'HAVE FUN!!!!'
    ];
    for (var i = 0; i < rule.length; i++) {
      if (i == rule.length - 1) {
        stderr.write(' ' *
            (((stdout.terminalColumns - rule[i].length - 12) / 2).round()));
        stderr.write('🎡');
        sleep(Duration(milliseconds: 20));
        stderr.write('🎢');
        sleep(Duration(milliseconds: 20));
        stderr.write('🎆');
        sleep(Duration(milliseconds: 20));
      } else {
        stderr.write(
            ' ' * (((stdout.terminalColumns - rule[i].length) / 2).round()));
      }
      for (var j = 0; j < rule[i].length; j++) {
        stderr.write(rule[i][j]);
        sleep(Duration(milliseconds: 20));
      }
      if (i == rule.length - 1) {
        stderr.write('🎆');
        sleep(Duration(milliseconds: 20));
        stderr.write('🎢');
        sleep(Duration(milliseconds: 20));
        stderr.write('🎡');
        sleep(Duration(milliseconds: 20));
      }
      print('');
    }
  }

  void monopoly() {
    print(
        // ignore: prefer_single_quotes
        r"""\
                                                                                    _____ ______    ________   ________    ________   ________   ________   ___            ___    ___ 
                                                                                   |\   _ \  _   \ |\   __  \ |\   ___  \ |\   __  \ |\   __  \ |\   __  \ |\  \          |\  \  /  /|
                                                                                   \ \  \\\__\ \  \\ \  \|\  \\ \  \\ \  \\ \  \|\  \\ \  \|\  \\ \  \|\  \\ \  \         \ \  \/  / /
                                                                                    \ \  \\|__| \  \\ \  \\\  \\ \  \\ \  \\ \  \\\  \\ \   ____\\ \  \\\  \\ \  \         \ \    / / 
                                                                                     \ \  \    \ \  \\ \  \\\  \\ \  \\ \  \\ \  \\\  \\ \  \___| \ \  \\\  \\ \  \____     \/  /  /  
                                                                                      \ \__\    \ \__\\ \_______\\ \__\\ \__\\ \_______\\ \__\     \ \_______\\ \_______\ __/  / /    
                                                                                       \|__|     \|__| \|_______| \|__| \|__| \|_______| \|__|      \|_______| \|_______||\___/ /     
                                                                                                                                                                         \|___|/      
                """);
  }

  void welcome() {
    print(r"""\
                                                            __          __         _                                         _______            __  __                                           _         
                                                            \ \        / /        | |                                       |__   __|          |  \/  |                                         | |        
                                                             \ \  /\  / /    ___  | |   ___    ___    _ __ ___     ___         | | ___         | \  / |   ___    _ __     ___    _ __     ___   | |  _   _ 
                                                              \ \/  \/ /    / _ \ | |  / __|  / _ \  | '_ ` _ \   / _ \        | |/ _ \        | |\/| |  / _ \  | '_ \   / _ \  | '_ \   / _ \  | | | | | |
                                                               \  /\  /    |  __/ | | | (__  | (_) | | | | | | | |  __/        | | (_) |       | |  | | | (_) | | | | | | (_) | | |_) | | (_) | | | | |_| |
                                                                \/  \/      \___| |_|  \___|  \___/  |_| |_| |_|  \___|        |_|\___/        |_|  |_|  \___/  |_| |_|  \___/  | .__/   \___/  |_|  \__, |
                                                                                                                                                                                | |                   __/ |
                                                                                                                                                                                |_|                  |___/ 
                """);
  }

  void testBoard() {
    // ignore: prefer_single_quotes
    print(r"""\
┏━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓
┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃
┃              ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃              ┃
┃              ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃              ┃
┣━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫                                                                                        
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫              
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫
┃ PropertyName ┃                     Player 1                            Player 2                        ┃ PropertyName ┃
┃              ┃               Current Money: XXXXXX               Current Money: XXXXXX                 ┃              ┃
┃              ┃               Current Debt : XXXXXX               Current Debt : XXXXXX                 ┃              ┃
┣━━━━━━━━━━━━━━┫               Current Propety: XX                 Current Propety: XX                   ┣━━━━━━━━━━━━━━┫                                                                                        
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫              
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫
┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ Start Point  ┃
┃              ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃              ┃
┃              ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃              ┃
┗━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛                                                                                        

""");
  }

  void clearConsole() {
    sleep(Duration(milliseconds: 500));
    print("\x1B[2J\x1B[0;0H");
    // print("xxx");
  }

  void testBoard2() {
    // ignore: prefer_single_quotes
    print(r"""\
┏━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓
┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃
┃ XXXXXXXXXXX  ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ XXXXXXXXXXX  ┃
┃ XXXXXXXXXXX  ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ XXXXXXXXXXX  ┃
┣━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫                                                                                        
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫              
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫
┃ PropertyName ┃                     Player 1                            Player 2                        ┃ PropertyName ┃
┃              ┃               Current Money: XXXXXX               Current Money: XXXXXX                 ┃ XXXXXXXXXXX  ┃
┃              ┃               Current Debt : XXXXXX               Current Debt : XXXXXX                 ┃ XXXXXXXXXXX  ┃
┣━━━━━━━━━━━━━━┫               Current Propety: XX                 Current Propety: XX                   ┣━━━━━━━━━━━━━━┫                                                                                        
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫              
┃ PropertyName ┃                                                                                         ┃ PropertyName ┃
┃ currentLevel ┃                                                                                         ┃ currentLevel ┃
┃ PlayerName   ┃                                                                                         ┃ PlayerName   ┃
┣━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫
┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ Start Point  ┃
┃ XXXXXXXXXXX  ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ XXXXXXXXXXX  ┃
┃ XXXXXXXXXXX  ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ XXXXXXXXXXX  ┃
┃              ┃              ┃              ┃              ┃              ┃              ┃              ┃              ┃
┗━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛                                                                                        

""");
  }

  void clearConsole2() {
    for (int i = 0; i < stdout.terminalLines; i++) {
      stdout.writeln();
    }
  }

  void clearConsole3() {
    print(Process.runSync("cmd", ['C "cls"'], runInShell: true).stdout);
  }

  void clearConsoleDice() {
    sleep(Duration(milliseconds: 250));
    console.clearScreen();
    console.resetCursorPosition();
    console.writeLine();
  }

  void clearConsole4() {
    if (Platform.isWindows) {
      // not tested, I don't have Windows
      // may not to work because 'cls' is an internal command of the Windows shell
      // not an executeable
      print(Process.runSync('cls', [], runInShell: true).stdout);
    } else {
      print(Process.runSync('clear', [], runInShell: true).stdout);
    }
  }

  void getDice(Board board) {
    // ignore: prefer_single_quotes
    print(r"""\
-----
|   |
| o |
|   |
-----
    """);
    clearConsoleDice();
    displayTable(board);
    // ignore: prefer_single_quotes
    print(r"""\
-----
|o  |
|   |
|  o|
-----
    """);
    clearConsoleDice();
    displayTable(board);
    // ignore: prefer_single_quotes
    print(r"""\
-----
|o  |
| o |
|  o|
-----
    """);
    clearConsoleDice();
    displayTable(board);
    // ignore: prefer_single_quotes
    print(r"""\
-----
|o o|
|   |
|o o|
-----
    """);
    clearConsoleDice();
    displayTable(board);
    // ignore: prefer_single_quotes
    print(r"""\
-----
|o o|
| o |
|o o|
-----
    """);
    clearConsoleDice();
    displayTable(board);
    // ignore: prefer_single_quotes
    print(r"""\
-----
|o o|
|o o|
|o o|
-----
    """);
    clearConsoleDice();
    displayTable(board);
    Random rnd;
    var min = 1;
    var max = 6 + 1;
    rnd = new Random();
    var r = min + rnd.nextInt(max - min);
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
      print(r"""\
-----
|o  |
| o |
|  o|
-----
    """);
    } else if (r == 4) {
      print(r"""\
-----
|o o|
|   |
|o o|
-----
    """);
    } else if (r == 5) {
      print(r"""\
-----
|o o|
| o |
|o o|
-----
    """);
    } else {
      print(r"""\
-----
|o o|
|o o|
|o o|
-----
    """);
    }
    print(r);
  }

  void testTable() {
    print(
        '┏━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓');
    print(
        '┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃ PropertyName ┃');
    print(
        '┃ XXXXXXXXXXX  ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ currentLevel ┃ XXXXXXXXXXX  ┃');
    print(
        '┃ XXXXXXXXXXX  ┃              ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ PlayerName   ┃ XXXXXXXXXXX  ┃');
    print(
        '┣━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫');
  }

  void displayTable(Board board) {
    print(
        '┏━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓');
    print(
        '┃     FREE     ┃   SEAVIEW    ┃   THE WHARF  ┃   MIDDLETON  ┃   NEW TOWN   ┃  SIVLER DOCK ┃ CENTRAL CITY ┃     GOTO     ┃');
    print('┃    🚗🚗🚗    ┃      ' +
        board.getBoard()[16].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[17].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[18].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[19].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[20].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[21].getCurrentLevel().toString() +
        '       ┃    ' +
        '🔒🔒🔒    ┃');
    stderr.write('┃');
    for (var i = 15; i < 22; i++) {
      if (board.getBoard()[i].currentPlayer.isEmpty) {
        stderr.write('              ┃');
      } else {
        var space = 13;
        var total = 0;
        for (var j = 0; j < board.getBoard()[i].currentPlayer.length; j++) {
          total += board.getBoard()[i].currentPlayer[j].length;
        }
        if (board.getBoard()[i].currentPlayer.length == 2) {
          for (var j = 0; j < board.getBoard()[i].currentPlayer.length; j++) {
            if (j == board.getBoard()[i].currentPlayer.length - 1) {
              stderr.write(board.getBoard()[i].currentPlayer[j] +
                  (' ' * (space - total - 1)) +
                  '┃');
            } else {
              stderr.write(' ' + board.getBoard()[i].currentPlayer[j] + ' ');
            }
          }
        } else {
          total = board.getBoard()[i].currentPlayer[0].length;
          stderr.write(' ' +
              board.getBoard()[i].currentPlayer[0] +
              (' ' * (space - total)) +
              '┃');
        }
      }
    }
    stderr.write('     JAIL     ┃');
    stderr.write('\n┃    🚗🚗🚗    ┃');
    for (var i = 16; i < 22; i++) {
      if (board.getBoard()[i].occupied == 'None') {
        stderr.write('     None     ┃');
      } else {
        var space = 14;
        var total = board.getBoard()[i].getOccupied().length;
        var totalSpace = (space - total) / 2;
        stderr.write(' ' * totalSpace.floor());
        stderr.write(board.getBoard()[i].getOccupied());
        stderr.write(' ' * totalSpace.round());
        stderr.write('┃');
      }
    }
    stderr.write('    🔒🔒🔒    ┃');
    stderr.write('\n┃  GO ANYWHERE ┃');
    for (var i = 16; i < 22; i++) {
      if (board.getBoard()[i].getVisitorPrice() < 1000000) {
        stderr.write(' ' * 4);
        stderr.write(board.getBoard()[i].getVisitorPrice().round());
        stderr.write(' ' * 5);
        stderr.write('┃');
      } else if (board.getBoard()[i].getVisitorPrice() < 10000000) {
        stderr.write(' ' * 3);
        stderr.write(board.getBoard()[i].getVisitorPrice().round());
        stderr.write(' ' * 4);
        stderr.write('┃');
      }
    }
    stderr.write('   3 TURNS    ┃');
    var opposite = 23;
    //Vertical
    for (var i = 14; i > 7; i--) {
      if (i == 14) {
        print(
            '\n┣━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫');
      } else {
        print(
            '                                                                                                                        ');
      }
      var space = 14;
      if (board.getBoard()[i].getName().length % 2 != 0) {
        stderr.write('┃' +
            (' ' *
                ((space - board.getBoard()[i].getName().length) / 2).round()) +
            board.getBoard()[i].getName() +
            (' ' *
                ((space - board.getBoard()[i].getName().length) / 2 - 1)
                    .round()) +
            '┃');
      } else {
        stderr.write('┃' +
            (' ' *
                ((space - board.getBoard()[i].getName().length) / 2).round()) +
            board.getBoard()[i].getName() +
            (' ' *
                ((space - board.getBoard()[i].getName().length) / 2).round()) +
            '┃');
      }
      stderr.write(
          '                                                                                         ');
      if (board.getBoard()[opposite].getName().length % 2 != 0) {
        stderr.write('┃' +
            (' ' *
                ((space - board.getBoard()[opposite].getName().length) / 2)
                    .round()) +
            board.getBoard()[opposite].getName() +
            (' ' *
                ((space - board.getBoard()[opposite].getName().length) / 2 - 1)
                    .round()) +
            '┃');
      } else {
        stderr.write('┃' +
            (' ' *
                ((space - board.getBoard()[opposite].getName().length) / 2)
                    .round()) +
            board.getBoard()[opposite].getName() +
            (' ' *
                ((space - board.getBoard()[opposite].getName().length) / 2)
                    .round()) +
            '┃');
      }
      print('\n┃      ' +
          board.getBoard()[i].getCurrentLevel().toString() +
          '       ┃                                                                                         ┃      ' +
          board.getBoard()[opposite].getCurrentLevel().toString() +
          '       ┃');
      //Get Current player vertical
      if (board.getBoard()[i].getCurrentPlayer().isEmpty) {
        stderr.write('┃              ┃');
      } else {
        var space = 13;
        var total = 0;
        stderr.write('┃');
        for (var j = 0; j < board.getBoard()[i].currentPlayer.length; j++) {
          total += board.getBoard()[i].currentPlayer[j].length;
        }
        if (board.getBoard()[i].currentPlayer.length == 2) {
          for (var j = 0; j < board.getBoard()[i].currentPlayer.length; j++) {
            if (j == board.getBoard()[i].currentPlayer.length - 1) {
              stderr.write(board.getBoard()[i].currentPlayer[j] +
                  (' ' * (space - total - 1)) +
                  '┃');
            } else {
              stderr.write(' ' + board.getBoard()[i].currentPlayer[j] + ' ');
            }
          }
        } else {
          total = board.getBoard()[i].currentPlayer[0].length;
          stderr.write((' ' * ((space - total) / 2).round()) +
              board.getBoard()[i].currentPlayer[0] +
              (' ' * (((space - total) / 2).floor() + 1)) +
              '┃');
        }
      }
      stderr.write(
          '                                                                                         ');
      //opposite vertical
      if (board.getBoard()[opposite].getCurrentPlayer().isEmpty) {
        stderr.write('┃              ┃');
      } else {
        stderr.write('┃');
        var space = 13;
        var total = 0;
        for (var j = 0;
            j < board.getBoard()[opposite].currentPlayer.length;
            j++) {
          total += board.getBoard()[opposite].currentPlayer[j].length;
        }
        if (board.getBoard()[opposite].currentPlayer.length == 2) {
          for (var j = 0; j < board.getBoard()[i].currentPlayer.length; j++) {
            if (j == board.getBoard()[opposite].currentPlayer.length - 1) {
              stderr.write(board.getBoard()[opposite].currentPlayer[j] +
                  (' ' * (space - total - 1)) +
                  '┃');
            } else {
              stderr.write(
                  ' ' + board.getBoard()[opposite].currentPlayer[j] + ' ');
            }
          }
        } else {
          total = board.getBoard()[opposite].currentPlayer[0].length;
          stderr.write((' ' * ((space - total) / 2).round()) +
              board.getBoard()[opposite].currentPlayer[0] +
              (' ' * (((space - total) / 2).floor() + 1)) +
              '┃');
        }
      }
      print('');
      //occupied
      if (board.getBoard()[i].getName() == 'POWER CARD') {
        stderr.write('┃              ┃');
      } else if (board.getBoard()[i].occupied == 'None') {
        stderr.write('┃     None     ┃');
      } else {
        var space = 14;
        var total = board.getBoard()[i].getOccupied().length;
        var totalSpace = (space - total) / 2;
        stderr.write('┃');
        stderr.write(' ' * totalSpace.floor());
        stderr.write(board.getBoard()[i].getOccupied());
        stderr.write(' ' * (totalSpace.floor() + 1));
        stderr.write('┃');
      }
      stderr.write(
          '                                                                                         ');
      if (board.getBoard()[opposite].getName() == 'POWER CARD') {
        stderr.write('┃              ┃');
      } else if (board.getBoard()[opposite].occupied == 'None') {
        stderr.write('┃     None     ┃');
      } else {
        var space = 14;
        var total = board.getBoard()[opposite].getOccupied().length;
        var totalSpace = (space - total) / 2;
        stderr.write('┃');
        stderr.write(' ' * totalSpace.round());
        stderr.write(board.getBoard()[opposite].getOccupied());
        stderr.write(' ' * (totalSpace.round() - 1));
        stderr.write('┃');
      } //Visitor price
      print('');
      stderr.write('┃');
      if (board.getBoard()[i].getVisitorPrice() == 0) {
        stderr.write(' Random Card  ┃');
      } else if (board.getBoard()[i].getVisitorPrice() < 1000000) {
        stderr.write(' ' * 4);
        stderr.write(board.getBoard()[i].getVisitorPrice().round());
        stderr.write(' ' * 4);
        stderr.write('┃');
      } else if (board.getBoard()[i].getVisitorPrice() < 10000000) {
        stderr.write(' ' * 3);
        stderr.write(board.getBoard()[i].getVisitorPrice().round());
        stderr.write(' ' * 4);
        stderr.write('┃');
      }
      stderr.write(
          '                                                                                         ');
      stderr.write('┃');
      if (board.getBoard()[i].getVisitorPrice() == 0) {
        stderr.write(' Random Card  ┃');
      } else if (board.getBoard()[opposite].getVisitorPrice() < 1000000) {
        stderr.write(' ' * 4);
        stderr.write(board.getBoard()[opposite].getVisitorPrice().round());
        stderr.write(' ' * 5);
        stderr.write('┃');
      } else if (board.getBoard()[opposite].getVisitorPrice() < 10000000) {
        stderr.write(' ' * 3);
        stderr.write(board.getBoard()[opposite].getVisitorPrice().round());
        stderr.write(' ' * 4);
        stderr.write('┃');
      }
      if (i == 8) {
        stderr.write(
            '\n┣━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫');
      } else {
        stderr.write(
            '\n┣━━━━━━━━━━━━━━┫                                                                                         ┣━━━━━━━━━━━━━━┫');
      }
      opposite++;
    }
    print(
        '\n┃     JAIL     ┃  BRIGHTSIDE  ┃ BAYVIEW DOCK ┃   WESTLANDS  ┃   STONESIDE  ┃  SUMMERGATE  ┃  PICCADILLYE ┃ START POINT  ┃');
    print('┃    🔒🔒🔒    ┃      ' +
        board.getBoard()[6].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[5].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[4].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[3].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[2].getCurrentLevel().toString() +
        '       ┃      ' +
        board.getBoard()[1].getCurrentLevel().toString() +
        '       ┃   ' +
        '<------    ┃');
    stderr.write('┃');
    for (var i = 7; i > -1; i--) {
      if (board.getBoard()[i].currentPlayer.isEmpty) {
        stderr.write('              ┃');
      } else {
        var space = 13;
        var total = 0;
        for (var j = 0; j < board.getBoard()[i].currentPlayer.length; j++) {
          total += board.getBoard()[i].currentPlayer[j].length;
        }
        if (board.getBoard()[i].currentPlayer.length == 2) {
          for (var j = 0; j < board.getBoard()[i].currentPlayer.length; j++) {
            if (j == board.getBoard()[i].currentPlayer.length - 1) {
              stderr.write(board.getBoard()[i].currentPlayer[j] +
                  (' ' * (space - total - 1)) +
                  '┃');
            } else {
              stderr.write(' ' + board.getBoard()[i].currentPlayer[j] + ' ');
            }
          }
        } else {
          total = board.getBoard()[i].currentPlayer[0].length;
          stderr.write(' ' +
              board.getBoard()[i].currentPlayer[0] +
              (' ' * (space - total)) +
              '┃');
        }
      }
    }
    for (var i = 6; i > 0; i--) {
      if (i == 6) {
        stderr.write('\n┃ STOP 3 TURNS ┃');
      }
      if (board.getBoard()[i].occupied == 'None') {
        stderr.write('     None     ┃');
      } else {
        var space = 14;
        var total = board.getBoard()[i].getOccupied().length;
        var totalSpace = (space - total) / 2;
        stderr.write(' ' * (totalSpace.round() - 1));
        stderr.write(board.getBoard()[i].getOccupied());
        stderr.write(' ' * (totalSpace.floor() + 1));
        stderr.write('┃');
      }
    }
    stderr.write('              ┃');
    stderr.write('\n┃              ┃');
    for (var i = 6; i > 0; i--) {
      if (board.getBoard()[i].getVisitorPrice() < 1000000) {
        stderr.write(' ' * 4);
        stderr.write(board.getBoard()[i].getVisitorPrice().round());
        stderr.write(' ' * 4);
        stderr.write('┃');
      } else if (board.getBoard()[i].getVisitorPrice() < 10000000) {
        stderr.write(' ' * 3);
        stderr.write(board.getBoard()[i].getVisitorPrice().round());
        stderr.write(' ' * 4);
        stderr.write('┃');
      }
    }
    stderr.write('  Salary 2 M  ┃');
    print(
        '\n┗━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛');
  }
}
