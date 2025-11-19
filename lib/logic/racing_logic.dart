class Car {
  final String name;
  int position = 0;

  Car(this.name) {
    if (this.name.isEmpty || this.name.length > 5) {
      throw Exception("이름은 1자 이상 5자 이하여야 합니다.");
    }
  }
}
