import 'dart:io';

import 'Board.dart';
import 'Operator.dart';
import 'PowerCard.dart';

class Player with ManageProperty {
  String name = '';
  double money = 0;
  List<int> occupied = [];
  int postition = 0;
  int stopStatus = 0;
  Player(String name, double money) {
    this.name = name;
    this.money = money;
  }
  void setStopStatus(int stopStatus) {
    this.stopStatus = stopStatus;
  }

  void effectPowerCardToPlayer(PowerCard powerCard, Board board) {
    money += powerCard.increaseMoney;
    money -= powerCard.decreaseMoney;
    if (powerCard.getTravelPosition != -1) {
      postition = getInputDigit(
          'You got powercard that can travel you to anywhere in this board! Where you want to go?[1-30] : ',
          1,
          30);
    }
    if (powerCard.getIncreasePropertyPrice != 0) {
      for (var i = 0; i < occupied.length; i++) {
        board
            .getBoard()[occupied[i]]
            .setMultipy(powerCard.increasePropertyPrice);
      }
    }
    if (powerCard.getDecreasePropertyPrice != 0) {
      for (var i = 0; i < occupied.length; i++) {
        board
            .getBoard()[occupied[i]]
            .setMultipy(powerCard.decreasePropertyPrice);
      }
    }
  }

  int getStopStatus() {
    return stopStatus;
  }

  void setPosition(int postition) {
    this.postition = postition;
  }

  int getPosition() {
    return postition;
  }

  double getMoney() {
    return money;
  }

  void setMoney(double money) {
    this.money = money;
  }

  void addMoney(double money) {
    this.money += money;
  }

  void reduceMoney(double money) {
    this.money -= money;
  }

  void addOccupied(int position) {
    occupied.add(position);
  }

  void removeOccupied(int position) {
    occupied.remove(position);
  }

  List<int> getOccupied() {
    return occupied;
  }

  void setName(String name) {
    this.name = name;
  }

  String getName() {
    return name;
  }
}
