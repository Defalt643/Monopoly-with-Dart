class PowerCard {
  String name = '';
  String effectName = '';
  double increaseMoney = 0;
  double decreaseMoney = 0;
  double increasePropertyPrice = 0;
  double decreasePropertyPrice = 0;
  int travelPosition = 0;
  PowerCard(
      String name,
      String effectName,
      double increaseMoney,
      double decreaseMoney,
      double increasePropertyPrice,
      double decreasePropertyPrice,
      int travelPosition) {
    this.name = name;
    this.effectName = effectName;
    this.increaseMoney = increaseMoney;
    this.decreaseMoney = decreaseMoney;
    this.increasePropertyPrice = increasePropertyPrice;
    this.decreasePropertyPrice = decreasePropertyPrice;
    this.travelPosition = travelPosition;
  }
  String get getName => name;

  set setName(String name) => this.name = name;

  // ignore: always_declare_return_types
  get getEffectName => effectName;

  set setEffectName(effectName) => this.effectName = effectName;

  // ignore: always_declare_return_types
  get getIncreaseMoney => increaseMoney;

  set setIncreaseMoney(increaseMoney) => this.increaseMoney = increaseMoney;

  // ignore: always_declare_return_types
  get getDecreaseMoney => decreaseMoney;

  set setDecreaseMoney(decreaseMoney) => this.decreaseMoney = decreaseMoney;

  // ignore: always_declare_return_types
  get getIncreasePropertyPrice => increasePropertyPrice;

  set setIncreasePropertyPrice(increasePropertyPrice) =>
      this.increasePropertyPrice = increasePropertyPrice;

  // ignore: always_declare_return_types
  get getDecreasePropertyPrice => decreasePropertyPrice;

  set setDecreasePropertyPrice(decreasePropertyPrice) =>
      this.decreasePropertyPrice = decreasePropertyPrice;

  // ignore: always_declare_return_types
  get getTravelPosition => travelPosition;
  set setTravelPosition(travelPosition) => this.travelPosition = travelPosition;
}
