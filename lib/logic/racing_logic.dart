import 'dart:math';

void main() {
  GameRound round = GameRound();
  round.setCars("pobi,crong,honux");

  // 확인용 출력
  print("참가자 수: ${round.carList.length}");
  print("첫 번째 차: ${round.carList[0].name}");
}

class Car {
  final String name;
  int position = 0;

  Car(this.name) {
    if (this.name.isEmpty || this.name.length > 5) {
      throw Exception("이름은 1자 이상 5자 이하여야 합니다.");
    }
  }

  void move() {
    int value = Random().nextInt(10);
    if (value >= 4) {
      this.position++;
    }
  }
}

class GameRound {
  List<Car> carList = [];

  setCars(String carNames) {
    List<String> names = carNames.split(",");
    for (String name in names) {
      carList.add(new Car(name));
    }
  }

  void carsMove() {
    for (Car car in carList) {
      car.move();
    }
  }
}
