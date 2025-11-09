import 'package:fast_app_base/screen/functions/reduce.dart';

// 리스트로 여러 인자 넘김, 인자는 여러 함수로 구성됨
// 함수들을 하나씩 수행하고 reduce로 한 데이터를 리턴
fxDart(List args) async {
  await reduce((a, f) async {
    if (a is Future) {
      return f(await a);
    }

    return f(a);
  }, args);
}