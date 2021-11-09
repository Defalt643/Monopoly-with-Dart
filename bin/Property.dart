import 'Player.dart';

class Property {
  String name = '';
  List<double> upgradePrice = [0, 0, 0];
  double visitorPrice = 0;
  String occupied = 'None';
  List<String> currentPlayer = [];
  double multipy = 1;
  int currentLevel = 1;
  Property(String name, List<double> upgradePrice, double visitorPrice) {
    this.name = name;
    this.upgradePrice = upgradePrice;
    this.visitorPrice = visitorPrice;
  }
  void addCurrentPlayer(Player player) {
    currentPlayer.add(player.getName());
  }

  void removeCurrentPlayer(Player player) {
    currentPlayer.remove(player.getName());
  }

  List<String> getCurrentPlayer() {
    return currentPlayer;
  }

  double getVisitorPrice() {
    if (currentLevel == 1) {
      return visitorPrice * multipy;
    } else if (currentLevel == 2) {
      return (visitorPrice * 1.5) * multipy;
    } else if (currentLevel == 3) {
      return (visitorPrice * 2) * multipy;
    } else {
      return (visitorPrice * 2.5) * multipy;
    }
  }

  void setVisitorPrice(double visitorPrice) {
    this.visitorPrice = visitorPrice;
  }

  List<double> getUpgradePrice() {
    return upgradePrice;
  }

  void setMultipy(double multipy) {
    this.multipy = multipy;
  }

  double getMultipy() {
    return multipy;
  }

  String getOccupied() {
    return occupied;
  }

  void setOccupied(Player player) {
    occupied = player.getName();
  }

  void setCurrentLevel(int level) {
    currentLevel = level;
  }

  int getCurrentLevel() {
    return currentLevel;
  }

  String getName() {
    return name;
  }
}
