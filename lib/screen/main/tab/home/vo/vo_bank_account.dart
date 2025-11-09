import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount {
  final Bank bank;
  int balance; // 잔액은 변하기 때문에 final 안 붙임
  final String? accountTypeName; // 은행 이름이 아닌 참조하는 이름일 수 있어서 nullable

  BankAccount(
    this.bank,
    this.balance, {
    this.accountTypeName,
  });

  @override
  String toString() {
    return "name : $accountTypeName, bank : ${bank.name}, balance : $balance";
  }
}