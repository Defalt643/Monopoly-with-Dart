import 'Operator.dart';
import 'PowerCard.dart';
import 'Property.dart';

class Board with Manage {
  List<Property> _board = [];

  List<Property> getBoard() {
    return _board;
  }

  List<PowerCard> getPowercard() {
    return _card;
  }

  set board(List<Property> board) {
    _board = board;
  }

  final List<PowerCard> _card = [];
  void initialBoard() {
    _board.add(Property('Start Point', [0, 0, 0], 0));
    _board.add(Property('PICCADILLY', [150000, 350000, 550000], 150000));
    _board.add(Property('SUMMERGATE', [200000, 400000, 600000], 200000));
    _board.add(Property('STONESIDE', [200000, 400000, 600000], 200000));
    _board.add(Property('WESTLANDS', [300000, 600000, 1000000], 300000));
    _board.add(Property('BAYVIEW DOCK', [300000, 600000, 1000000], 300000));
    _board.add(Property('BRIGHTSIDE', [400000, 800000, 1200000], 400000));
    _board.add(Property('JAIL', [0, 0, 0], 0));
    _board.add(Property('OLD TOWN', [500000, 1000000, 1400000], 500000));
    _board.add(Property('VINE STREET', [500000, 1000000, 1400000], 500000));
    _board.add(Property('CENTRAL QUAY', [600000, 1200000, 1600000], 600000));
    _board.add(Property('POWER CARD', [0, 0, 0], 0));
    _board.add(Property('SHINE VALLAGE', [700000, 1400000, 1800000], 700000));
    _board.add(Property('EAST BANK', [700000, 1400000, 1800000], 700000));
    _board.add(Property('TREETOP PARK', [900000, 1600000, 2000000], 900000));
    _board.add(Property('FREE PARK', [0, 0, 0], 0));
    _board.add(Property('SEAVIEW', [1100000, 1800000, 2200000], 1100000));
    _board.add(Property('THE WHARF', [1100000, 1800000, 2200000], 1100000));
    _board.add(Property('MIDDLETON', [1300000, 2000000, 2400000], 1300000));
    _board.add(Property('NEW TOWN', [1500000, 2200000, 2600000], 1500000));
    _board.add(Property('SILVER DOCK', [1500000, 2200000, 2600000], 1500000));
    _board.add(Property('CENTRAL CITY', [1700000, 2400000, 2800000], 1700000));
    _board.add(Property('GOTO JAIL', [0, 0, 0], 0));
    _board.add(Property('ROYAL COURT', [1900000, 2600000, 3000000], 1900000));
    _board.add(Property('THE MARINA', [1900000, 2600000, 3000000], 1900000));
    _board.add(Property('RIVERSIDE', [2100000, 2800000, 3200000], 2100000));
    _board.add(Property('POWER CARD', [0, 0, 0], 0));
    _board.add(Property('FORTUNE TOWN', [2300000, 3000000, 3500000], 2300000));
    _board.add(Property('DIAMOND HILL', [2300000, 3000000, 3500000], 2300000));
    _board.add(Property('STRAND', [2500000, 3200000, 3700000], 2500000));
  }

  void initCard() {
    //PowerCard(
    //String name,
    //String effectName,
    //double increaseMoney,
    //double decreaseMoney,
    // increasePropertyPrice,
    //double decreasePropertyPrice,
    //int travelPosition)
    _card.add(PowerCard('Reduce 1M dollar',
        'Reduce your money 1 million dollar', 0, 1000000, 0, 0, -1));
    _card.add(PowerCard('Reduce 500K dollar',
        'Reduce your money 500,000 dollar', 0, 500000, 0, 0, -1));
    _card.add(PowerCard('Increase 1M dollar',
        'Increase your money 1 million dollar', 1000000, 0, 0, 0, -1));
    _card.add(PowerCard('Increase 500K dollar',
        'Increase your money 500,000 dollar', 500000, 0, 0, 0, -1));
    _card.add(PowerCard(
        'Travel card', 'You can tavel anywhere in this board!', 0, 0, 0, 0, 1));
  }

  Board() {
    initialBoard();
    initCard();
  }
  void displayBoard() {
    for (var i = 0; i < _board.length; i++) {
      print('=' * 10);
      print(_board[i].getName());
      print(_board[i].getCurrentLevel());
      print(_board[i].getOccupied());
      print(_board[i].getVisitorPrice());
    }
  }
}
