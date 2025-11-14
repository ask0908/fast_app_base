main() {
  /// 객체지향 프로그래밍 특징

  /// 1. 추상화
  /// abstract class - extends
  /// abstract mixin class - with
  /// abstract interface class - implements, 여러 인터페이스 구현
  // final bird = Bird(0);
  // bird.wings;
  // bird.age;
  // bird.fly();

  /// 2. 상속
  /// extends

  /// 3. 다형성
  /// override
  /// implement
  final bird = Bird(0, "2 legs");
  final dog = Dog(0, "4 legs");

  // Bird가 CanRun을 implement해서 CanRun 타입 runner1 변수에 할당 가능
  CanRun runner1 = bird;
  runRace(<CanRun>[dog, bird]);

  /// 4. 캡슐화
  /// private(언더바)
  /// 함수
  /// get, set

}

void runRace(List<CanRun> list) {
  for (final runner in list) {
    runner.run("1번 경기");
  }
}

abstract class Animal {
  int _age;

  int get age => _age;
  // set age(int value) {
  //   _age = value;
  // }
  void setAge(int value) {
    _age = value;
  }

  // 추상 클래스에 생성자가 있어도 인스턴스화 불가
  // 개념을 추상화한 것
  Animal(this._age);

  void eat() {
    print("기본 먹기");
  }
}

abstract mixin class CanFly {
  String wings = "wings";

  void fly();
}

// mixin은 다른 믹스인을 확장할 수 없지만 인터페이스 클래스들을 구현했다고 가정할 수 있음
// abstract mixin class CanRunMixin extends CanFly {
//   String legs = "legs";
//
//   void run() {
//     print("기본 달리기");
//   }
// }

// interface가 붙으면 implements, mixin 붙으면 with + 콤마
// interface class는 extends 써서 인터페이스를 확장 가능
abstract interface class CanRun {
  String get legs;
  set legs(String value);

  int run(String raceName);
}

class Dog extends Animal implements CanRun {
  Dog(super.age, this.legs);

  @override
  void eat() {
    print("개가 먹음");
  }

  @override
  String legs;

  @override
  int run(String raceName) {
    print("$raceName 개가 달림");
    return 5;
  }
}

// interface class 안에 기본 구현이 있어도 컴파일 에러 발생
// 변수를 기본값으로 초기화하거나 게터세터를 명시적으로 만들면 됨
class Bird extends Animal with CanFly implements CanRun {
  Bird(super.age, this.legs);

  @override
  void eat() {
    print("새가 먹음");
  }

  @override
  void fly() {
    print("새가 난다");
  }

  @override
  String legs;

  @override
  int run(String raceName) {
    print("$raceName 새가 달림");
    return 2;
  }
}