// curry : 함수를 쪼갬
// 함수에 a, b 2개 파라미터 들어가는 함수가 있을 때 이 함수를 curry()에 넣음
// final curryFunction = currn(F(a, b))
// curryFunction(a)(b)
// 원래 한 번에 2개 인자를 넣어야 하는데 curry()로 함수가 쪼개지면 a만 넣었을 때 동작하지 않다가 b도 넣으면 원래 함수 실행됨
// 함수를 쪼개 합성 함수 만들 때 쓸 수 있음
curry(Function f) => (a, {Iterable? args}) => (args?.length ?? 0) > 1 ? f(a, args) : (b) => f(a, b);

main() {
  // print(curryMultiply(2)(3));
  // print(curryMultiply(3)(6));

  final multyply2 = curryMultiply(2);
  for (int i = 1; i <= 10; i++) {
    print(multyply2(i));
  }
}

final multiply = (int a, int b) => a * b;

final curryMultiply = curry(multiply);