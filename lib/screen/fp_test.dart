import 'dart:async';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/functions/run.dart';
import 'package:fast_app_base/screen/fx_dart.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

import 'functions/map.dart';

main() async {
  // 함수형 프로그래밍

  // 절차적 프로그래밍 - 명령형 프로그래밍
  // final accounts = getAccounts();
  // final list = <String>[];
  //
  // for (final account in accounts) {
  //   final user = getUser(account.userId);
  //   list.add(user.name);
  // }
  // print(list);

  // 함수형 프로그래밍 - 선언형 프로그래밍
  // print("start");
  // final nameList = await (await getAccounts()).toStream()
  //     .map(accountToUserId)
  //     .asyncMap(userIdToFutureUser) // stream.dart 안의 asyncMap 사용, async / await 키워드 불필요
  //     .map(userToName)
  //     .toList(); // 스트림에서 toList는 Future 함수라 맨 앞에 await를 다시 붙여야 리스트 안의 요소들을 볼 수 있음. 안 붙이면 Instance of 'Future<List<String>>' 표시
  // print(nameList);
  // print("end");

  // print("start");
  // await fxDart([
  //   await getAccounts(),
  //   (accounts) => map((BankAccount account) => account.userId, accounts),
  //   (List<int> userIds) => asyncMap(getUser, userIds),
  //   (users) => map((User user) => user.name, users),
  //   (names) => runAll((names) => print(names.toList()), names)
  // ]);
  // print("end");
}

String userToName(user) => user.name;

FutureOr<User> userIdToFutureUser(userId) => getUser(userId);

int accountToUserId(account) => account.userId;

Future<List<BankAccount>> getAccounts() async {
  await Future.delayed(const Duration(milliseconds: 300));
  return bankAccounts;
}

Future<User> getUser(int id) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return switch (id) {
    1 => User(id, "Jason"),
    2 => User(id, "Dart"),
    3 => User(id, "Baby"),
    4 => User(id, "Love"),
    5 => User(id, "Popcorn"),
    _ => User(id, "Unknown")
  };
}

class User {
  final int id;
  final String name;

  User(this.id, this.name);
}