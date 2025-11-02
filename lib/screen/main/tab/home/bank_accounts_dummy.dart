import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan = BankAccount(bankShinhan, 30000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountKakao = BankAccount(bankKakao, 300000000);
final bankAccountTtoss = BankAccount(bankTtos, 3000000000, accountTypeName: "입출금통장");

final List<BankAccount> bankAccounts = [
  bankAccountShinhan,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountTtoss,
];