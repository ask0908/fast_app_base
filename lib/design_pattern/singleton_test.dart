class NormalObject {
  int count = 0;
}

class SingletonObject {
  int count = 0;

  // 기본 생성자를 private로 만듬
  SingletonObject._();

  static final SingletonObject instance = SingletonObject._();

  factory SingletonObject() {
    return instance;
  }
}

main() {
  final o1 = SingletonObject();
  final o2 = SingletonObject();
  final o3 = SingletonObject.instance;

  print(o1 == o2);
  print(o2 == o3);
  print(o1 == o3);
}