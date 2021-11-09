import 'dart:io';

void TabLoadGame() {
  // ignore: unused_local_variable
  var time = 0;
  for (var i = 0; i < 101; i++) {
    stdout.write('[');
    if (i % 4 == 0) {
      stdout.write('=' * time);
      stdout.write(' ' * (25 - time));
      stdout.write(']$i %');
      sleep(Duration(milliseconds: 300));
      print("\x1B[2J\x1B[0;0H");
      time++;
      continue;
    }
    stdout.write('=' * time);
    stdout.write(' ' * (25 - time));
    stdout.write(']$i %');
    sleep(Duration(milliseconds: 300));
    print("\x1B[2J\x1B[0;0H");
  }
}

void displayRule() {
  // ignore: omit_local_variable_types
  String line1 =
      'Welcome to Monopoly game \n1.From start both player will receive 10M dollar\n2.If player below than 0 another player will win!\n3.you can buy any property if you have enough money\n4.you can takeover property from another player if your money have more than property price *1.5\n5.This game have 30 slot contains [Start Point , Property , Powercard , JAIL , FREE GO ANYWHERE ,GOTO JAIL]\n6.If you move to Powercard slot or move to slot 12 or 27 you will receive a random powercard(5 powercard in deck)\n7.If you move to Jail or move to slot 8 you will be jail for 3 turns (Stop playing for 3 turns)\n8.If you move to Free Go Anywhere or move to slot 16 you will go to anywhere in this game as you want!\n9.If you move to Goto Jail or slot 23 you will move to jail and will be jail for 3 turns(Stop playing for 3 turns)';
  var rule = [
    'Welcome to Monopoly game',
    '1.From start both player will receive 10M dollar',
    '2.If player below than 0 another player will win!',
    '3.you can buy any property if you have enough money',
    '4.you can takeover property from another player if your money have more than property price *1.5',
    '5.This game have 30 slot contains [Start Point , Property , Powercard , JAIL , FREE GO ANYWHERE ,GOTO JAIL]',
    '6.If you move to Powercard slot or move to slot 12 or 27 you will receive a random powercard(5 powercard in deck)',
    '7.If you move to Jail or move to slot 8 you will be jail for 3 turns (Stop playing for 3 turns)',
    '8.If you move to Free Go Anywhere or move to slot 16 you will go to anywhere in this game as you want!',
    '9.If you move to Goto Jail or slot 23 you will move to jail and will be jail for 3 turns(Stop playing for 3 turns)'
  ];
  for (var i = 0; i < rule.length; i++) {
    stderr
        .write(' ' * (((stdout.terminalColumns - rule[i].length) / 2).round()));
    for (var j = 0; j < rule[i].length; j++) {
      stderr.write(rule[i][j]);
      sleep(Duration(milliseconds: 20));
    }
    print('');
  }
  // for (var i = 0; i < line1.length; i++) {
  //   stderr.write(line1[i]);
  //   sleep(Duration(milliseconds: 20));
  // }
}

void main(List<String> arguments) {
  // print('Your money can\'t take over this property.');
  displayRule();
  // TabLoadGame();
}
