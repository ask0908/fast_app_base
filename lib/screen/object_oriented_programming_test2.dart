main() {
  final Fruit fruit = getFruit();
  String? color = fruit.color;
}

getFruit() => Fruit.APPLE;

// 이렇게 짜면 switch를 만들 필요가 없고 "String? color = fruit.color;" 코드를 수정할 필요 없음
enum Fruit {
  APPLE("red"),
  BANANA("yellow"),
  GRAPE("purple");

  final String color;

  const Fruit(this.color);
}