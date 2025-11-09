import 'dart:collection';

import 'package:fast_app_base/common/dart/collection/collection_ext.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan = BankAccount(bankShinhan, 30000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan4 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan5 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan6 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan7 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan8 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan9 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan10 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan11 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountKakao = BankAccount(bankKakao, 300000000);
final bankAccountKakao2 = BankAccount(bankKakao, 300000000, accountTypeName: "특별통장");
final bankAccountTtoss = BankAccount(bankTtos, 3000000000, accountTypeName: "입출금통장");

final List<BankAccount> bankAccounts = [
  bankAccountShinhan,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountShinhan4,
  bankAccountShinhan5,
  bankAccountShinhan6,
  bankAccountShinhan7,
  bankAccountShinhan8,
  bankAccountShinhan9,
  bankAccountShinhan10,
  bankAccountShinhan11,
  bankAccountKakao,
  bankAccountTtoss,
];

// Animal 자체는 객체가 될 수 없어서 추상 클래스 선언해도 됨
abstract class Animal {
  void eat() {}
}

class Dog extends Animal {
  void eat() {
    print("dog");
  }
}

class Cat extends Animal {
  void eat() {
    print("cat");
  }
}

class Cow extends Animal {
  void eat() {
    print("cow");
  }
}

class Result<T> {
  final T data;

  Result(this.data);
}

class ResultString {
  final String data;

  ResultString(this.data);
}

class ResultDouble {
  final double data;

  ResultDouble(this.data);
}

Result<String> doWork() {
  return Result("데이터");
}

ResultDouble doWork2() {
  return ResultDouble(3.14);
}

// Animal을 상속하거나 Animal 타입이 리턴돼야 함
Result doWork3<Result extends Animal>(Result Function() animalCreator) {
  return animalCreator();
}

main() {
  // 함수 호출 시 제네릭 쓰지 않으면 1번 매개변수 타입이 dynamic이라 어떤 값이든 사용 가능
  // final result = doWork3(123, ["sdf", "asd"]);

  // result == Dog 타입
  final result = doWork3<Dog>(() => Dog());
}