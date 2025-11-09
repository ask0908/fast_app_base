// 같은 타입 2개 받아서 combine 함수로 2개를 하나로 합쳐 리턴
// combine은 넘어오는 모든 값들을 하나로 합쳐 리턴
Function reduce = <E>(E Function(E value, E element) combine, Iterable<E> iterable) {
  Iterator<E> iterator = iterable.iterator;
  if (!iterator.moveNext()) {
    throw Exception("이터러블에 값이 없음");
  }

  E value = iterator.current;

  while (iterator.moveNext()) {
    value = combine(value, iterator.current);
  }

  return value;
};

main() {
  print(reduce<int>(add, [1, 2]));
}

int add(int a, int b) => a + b;

int multiply(int a, int b) => a * b;