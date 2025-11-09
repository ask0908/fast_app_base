import 'dart:async';

import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

main() async {
  // Future 생성, 수행
  // print("start");
  // // 메인 함수에 async 붙으면 이 함수 끝날 때까지 대기
  // final account = await getBankAccounts();
  // print("end");

  // Future timeout
  // then 사용 가능
  // getBankAccounts().timeout(Duration(seconds: 1)).then();

  // print("start");
  // // 에러 발생하고 end 출력 안 됨
  // final result = await getBankAccounts().timeout(Duration(seconds: 1))
  //     // Future 타입이 bankAccount를 리턴하는 거라 onError에선 어떤 리스트를 리턴할지 명시 필요
  //     .onError((error, stackTrace) => []);
  // print("result : $result");
  // print("end");

  // Future 에러 처리
  print("start");
  // 에러 떴다고 어떤 데이터 리턴하는 게 말이 안 됨. 메시지 표시 같은 안내 필요
  // onError를 쓰기보다 timeout 지정 후 try-catch로 감쌈
  getBankAccounts().timeout(Duration(seconds: 1)).then((value) {
    print(value);
  }).catchError((error, stackTrace) {
    print(error);
    print(stackTrace);
  });
  print("end");

  // FutureOr - 동기, 비동기 중 하나
}

abstract class DoWorkInterface {
  // DoWorkInterface를 상속, 구현한 클래스가 이 함수 구현 시 동기로 짜든 비동기로 짜든 상관없음
  FutureOr<String> doWork();
}

class SyncWork extends DoWorkInterface {
  @override
  String doWork() {
    //
  }
}

class AsyncWork extends DoWorkInterface {
  @override
  Future<String> doWork() async {
    //
  }
}

Future<List<BankAccount>> getBankAccounts() async {
  await sleepAsync(Duration(seconds: 2));
  return bankAccounts;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}