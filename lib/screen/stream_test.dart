import 'dart:async';

main() {
  /// Stream 기본
  /// Future : 1번 데이터를 가져옴
  /// Stream : 여러 번 데이터 받을 수 있음, 데이터 생성하는 쪽에서 계속 보냄

  /// Stream 생성, 수행
  /// 1. async*
  /// 2. StreamController

  // countStream(4).listen((event) {
  //   print(event); // 1~4
  // });

  // final controller = StreamController<int>();
  // final stream = controller.stream;
  // stream.listen((event) {
  //   print(event);
  // });
  // addDataToTheSink(controller);

  /// Stream 데이터 변환
  // countStream(4).map((e) => "$e초 경과").listen((event) {
  //   print(event); // 1~4
  // });

  /// 위젯에서 Stream 데이터 표현

  /// Stream 데이터 관찰 2 - BroadcastStream
  // final broadcastStream = countStream(4).asBroadcastStream();
  // broadcastStream.listen((event) {
  //   print(event);
  // });
  //
  // Future.delayed(Duration(seconds: 2), () {
  //   broadcastStream.listen((event) {
  //     print("2초 후 : $event");
  //   });
  // });

  /// 2개 위젯에서 하나의 BroadcastStream 데이터 표현

  /// Stream 예외 처리
  countStream(5).listen((event) {
    print(event);
  }, cancelOnError: false).onError((e, trace) {
    print(e.toString());
  });
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    print("Before add sink");
    controller.sink.add(i); // 데이터 전달
    print("After add sink");
    await sleepAsync(Duration(seconds: 1));
  }
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    if (i == 2) {
      yield* Stream.error(Exception("에러 발생"));
    } else {
      yield i;
    }
    await sleepAsync(Duration(seconds: 1));
  }
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}