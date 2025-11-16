import 'dart:convert';
import 'dart:isolate';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/s_number.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

// class HomeFragment extends StatefulWidget {
//   const HomeFragment({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<HomeFragment> createState() => _HomeFragmentState();
// }
//
// class _HomeFragmentState extends State<HomeFragment> {
//
//   // 실제론 상태관리 라이브러리, 별도 클래스 안에 있을 값
//   bool isLike = false;
//
//   late final stream = countStream(5).asBroadcastStream();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black,
//       child: Stack(
//         children: [
//           RefreshIndicator(
//             edgeOffset: TtosAppBar.appBarHeight,
//             onRefresh: () async {
//               await sleepAsync(500.ms);
//             },
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.only(
//                 top: TtosAppBar.appBarHeight + 10,
//                 bottom: MainScreenState.bottomNavigationBarHeight,
//               ),
//               child: Column(
//                 children: [
//                   StreamBuilder(
//                     stream: stream,
//                     builder: (context, snapshot) {
//                       final count = snapshot.data;
//                       final status = snapshot.connectionState;
//                       switch (status) {
//                         case ConnectionState.none:
//                         case ConnectionState.waiting:
//                           return CircularProgressIndicator();
//                         case ConnectionState.active:
//                           return count!.text.size(30).color(Colors.white).bold.make();
//                         case ConnectionState.done:
//                           return "완료".text.size(30).color(Colors.white).bold.make();
//                       }
//                     },
//                   ),
//                   StreamBuilder(
//                     stream: stream,
//                     builder: (context, snapshot) {
//                       final count = snapshot.data;
//                       final status = snapshot.connectionState;
//                       switch (status) {
//                         case ConnectionState.none:
//                         case ConnectionState.waiting:
//                           return CircularProgressIndicator();
//                         case ConnectionState.active:
//                           return count!.text.size(30).color(Colors.white).bold.make();
//                         case ConnectionState.done:
//                           return "완료".text.size(30).color(Colors.white).bold.make();
//                       }
//                     },
//                   ),
//                   BigButton(
//                     "토스뱅크",
//                     onTap: () async {
//                       print("start");
//                       final result = await Nav.push(NumberScreen());
//                       print("result : $result");
//                       print("end");
//                     },
//                   ),
//                   height10,
//                   RoundedContainer(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         "자산".text.bold.white.make(),
//                         height5,
//                         ...bankAccounts
//                             .map(
//                               (e) => BankAccountWidget(e),
//                             )
//                             .toList()
//                       ],
//                     ),
//                   ),
//                 ],
//               ).pSymmetric(h: 20),
//             ),
//           ),
//           TtosAppBar(),
//         ],
//       ),
//     );
//   }
//
//   Stream<int> countStream(int max) async* {
//     // 빌드 타임에 바로 스트림이 실행돼 로딩을 볼 수 없으니 일부러 2초 딜레이
//     await sleepAsync(2.seconds);
//     for (int i = 1; i <= max; i++) {
//       yield i;
//       await sleepAsync(1.seconds);
//     }
//   }
//
//   void showSnackbar(BuildContext context) {
//     context.showSnackbar('snackbar 입니다.',
//         extraButton: Tap(
//           onTap: () {
//             context.showErrorSnackbar('error');
//           },
//           child: '에러 보여주기 버튼'
//               .text
//               .white
//               .size(13)
//               .make()
//               .centered()
//               .pSymmetric(h: 10, v: 5),
//         ));
//   }
//
//   Future<void> showConfirmDialog(BuildContext context) async {
//     final confirmDialogResult = await ConfirmDialog(
//       '오늘 기분이 좋나요?',
//       buttonText: "네",
//       cancelButtonText: "아니오",
//     ).show();
//     debugPrint(confirmDialogResult?.isSuccess.toString());
//
//     confirmDialogResult?.runIfSuccess((data) {
//       ColorBottomSheet(
//         '❤️',
//         context: context,
//         backgroundColor: Colors.yellow.shade200,
//       ).show();
//     });
//
//     confirmDialogResult?.runIfFailure((data) {
//       ColorBottomSheet(
//         '❤️힘내여',
//         backgroundColor: Colors.yellow.shade300,
//         textColor: Colors.redAccent,
//       ).show();
//     });
//   }
//
//   Future<void> showMessageDialog() async {
//     final result = await MessageDialog("안녕하세요").show();
//     debugPrint(result.toString());
//   }
//
//   void openDrawer(BuildContext context) {
//     Scaffold.of(context).openDrawer();
//   }
//
//   void heavyComputationWork() {
//     int count = 0;
//     for (int i = 0; i < 9000000000; i++) {
//       count++;
//     }
//
//     print(count);
//   }
//
//   Future<void> heavyComputationWorkWithIsolateSpawn() async {
//     final errorPort = ReceivePort();
//     errorPort.listen((element) {
//       debugPrint("Isolate error");
//       debugPrint(element);
//     });
//
//     final exitPort = ReceivePort();
//     exitPort.listen((message) {
//       debugPrint("exit - done");
//     });
//
//     final progressListenPort = ReceivePort();
//     progressListenPort.listen((message) {
//       debugPrint("received from isolate");
//       debugPrint(message.toString());
//     });
//
//     // run은 에러 처리 매개변수가 없어서 try-catch로 감싸야 함
//     // 진행률도 못 받아서 프로그레스 표시 불가 -> 진행률 표시할 필요 없는 무거운 작업에 사용
//     try {
//       final isolateResult = await Isolate.run<String>(() {
//         const message = '{"message": "Hello, world!"}';
//         final jsonObject = json.decode(message);
//         debugPrint(jsonObject["message"]);
//         int count = 0;
//         debugPrint("Isolate count start");
//
//         final startTime = DateTime.now();
//         for (int i = 0; i < 1500000000; i++) {
//           count += 1;
//         }
//
//         debugPrint(count.toString());
//         debugPrint("${DateTime.now().difference(startTime).inMilliseconds / 1000}초");
//         return "Run Isolate done";
//       });
//
//       debugPrint(isolateResult);
//     } catch (e) {
//       print(e);
//     }
//
//     final isolate = await Isolate.spawn((port) {
//       int count = 0;
//       debugPrint("Isolate count start");
//       final startTime = DateTime.now();
//       for (int i = 0; i < 1500000000; i++) {
//         count += 1;
//
//         // if (i % 1500000000 == 0) {
//         //   port.send(count);
//         //   debugPrint("${DateTime.now().difference(startTime).inMilliseconds / 1000}초");
//         // }
//       }
//
//       debugPrint(count.toString());
//       debugPrint("${DateTime.now().difference(startTime).inMilliseconds / 1000}초");
//     },
//       progressListenPort.sendPort, // sendPort == spawn()의 port
//       onError: errorPort.sendPort,
//       onExit: exitPort.sendPort,
//     );
//
//     debugPrint("spawn done");
//     delay(() {
//       debugPrint("force kill");
//       isolate.kill(priority: Isolate.immediate);
//     }, 1000.ms);
//   }
// }