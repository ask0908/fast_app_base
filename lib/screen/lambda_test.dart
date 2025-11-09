import 'package:fast_app_base/common/dart/collection/sort_functions.dart';

main() {
  // 람다 표현
  // (int param, String param) => 리턴값

  // int add(int a, int b) {
  //   return a + b;
  // }

  // (int a, int b) => a + b;

  // 선언된 함수에 이름이 매핑돼 있음
  // int add(int a, int b) => a + b;

  // 이름 없는 람다가 변수에 담김
  // final add2 = (int a, int b) => a + b;
  // final add3 = add2;
  // print(add2 == add3); // true

  // 람다 특징

  // 1. 익명 : 이름 지을 수 없음(변수에 담을 수 있음)
  // 2. 함수 : 클래스에 종속되지 않음
  // 3. 전달 : 1급 객체로서 함수를 파라미터로 전달, 변수에 저장 가능
  // 4. 간결성 : 익명 클래스처럼 많은 코드 구현할 필요 없음

  // 리스트 정렬
  // final list = [5, 2, 4, 1, 3];
  // // list.sort(); // compare 함수 넣지 않으면 기본 오름차순 정렬
  // list.sort((a, b) => a == b
  //     ? 0
  //     : a > b
  //         ? 1
  //         : -1);
  // print(list); // 1~5

  // final list = [Animal(5, "강아지"), Animal(3, "치타"), Animal(2, "토끼"), Animal(6, "하마"), Animal(20, "펭귄")];
  // list.sort(byStringField<Animal>((e) => e.name));
  // print(list); // [animal : 6, name : 하마, animal : 20, name : 펭귄, animal : 2, name : 토끼, animal : 3, name : 치타, animal : 5, name : 강아지]
  // list.sort(byStringField<Animal>((e) => e.name, reverse: true));
  // print(list); // [animal : 5, name : 강아지, animal : 3, name : 치타, animal : 2, name : 토끼, animal : 20, name : 펭귄, animal : 6, name : 하마]

  final add = (a) => (b) => a + b;
  final add2 = add(2); // a = 2
  print(add2(3)); // b = 3
  print(add(2)(3));
}

void run(int Function(int a, int b) add2, int a, int b) {
  final sum = add2(a, b);
  print(sum);
}

class Animal {
  final int age;
  final String name;

  Animal(this.age, this.name);

  @override
  String toString() {
    return "animal : $age, name : $name";
  }
}