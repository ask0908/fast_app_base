import 'dart:io';

main() async {
  // List, Iterable
  // final List list = ["blue", "yellow", "red"];
  // final iteraotr = list.iterator;
  // print(iteraotr.current);
  // while (iteraotr.moveNext()) {
  //   print(iteraotr.current); // blue~red
  // }

  // sync*로 Iterable 만들기
  // await for : 스트림 넣을 수 있음
  await for (final message in countStream(3)) {
    print(message);
  }

  // async*로 스트림 만들기

  // yield*로 Iterable / 스트림 연장시키기
}

Iterable<String> countIterable(int max) sync* {
  for (int i = 1; i <= max; i++) {
    yield i.toString();
  }

  yield "새해 복 많이";

  yield* countIterable(max);
  // 새해 복 많이 뒤에 순서대로 출력
  // yield* ["1", "2", "3"];
}

Stream<String> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await sleepAsync(Duration(seconds: 1));
    yield i.toString();
  }

  yield "새해 복 많이";
  yield* countStream(to);
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}