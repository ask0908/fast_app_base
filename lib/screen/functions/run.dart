// 리스트에 담겨 온 값들을 함수에 넣고 실행
Iterable<T> runAll<T>(void Function(Iterable<T> value) doFunction, Iterable<T> next) {
  doFunction(next);
  return next;
}

Iterable<T> runEach<T>(void Function(T value) doFunction, Iterable<T> next) {
  for (final T item in next) {
    doFunction(item);
  }

  return next;
}

main() {
  runAll((value) => print(value), [1, 2, 3, 4]); // [1, 2, 3, 4]
  // runEach((value) => print(value), [1, 2, 3, 4]); // 1~4
}