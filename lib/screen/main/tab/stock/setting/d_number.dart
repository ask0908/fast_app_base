import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_text_watching_bear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nav/dialog/dialog.dart';

// 숫자를 이전 화면에 리턴해야 해서 result 미리 정의
class NumberDialog extends DialogWidget<int> {
  NumberDialog({
    super.key,
    super.animation = NavAni.Fade, // 바텀 시트 표시 애니메이션
  });

  @override
  DialogState<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends DialogState<NumberDialog> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final numberFocus = FocusNode();
  final passwordFocus = FocusNode();
  final textBearController = TextWatchingBearController();

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState() {
    numberController.addListener(() {
      setState(() {
        look = numberController.text.length.toDouble() * 1.5; // 클수록 곰 눈동자 움직이는 게 선명해짐
      });
    });

    numberFocus.addListener(() {
      setState(() {
        check = numberFocus.hasFocus;
      });
    });

    passwordFocus.addListener(() {
      setState(() {
        handsUp = passwordFocus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                "숫자를 입력하시오".text.color(Colors.white).make(),
                SizedBox(
                  width: 230,
                  height: 230,
                  child: TextWatchingBear(
                    check: check,
                    handsUp: handsUp,
                    look: look,
                    controller: textBearController,
                  ),
                ),
                TextField(
                  focusNode: numberFocus,
                  controller: numberController,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  focusNode: passwordFocus,
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                ),
                RoundButton(
                  text: "완료",
                  // 곰 애니메이션 보기 위해 async 추가
                  onTap: () async {
                    final text = numberController.text;
                    try {
                      int number = int.parse(text);
                      textBearController.runSuccessAnimation();
                      await sleepAsync(1000.ms);
                      // 닫을 때 숫자를 넘겨야 다이얼로그 띄운 쪽에서 받을 수 있음
                      widget.hide(number);
                    } catch (e) {
                      // FormatException: Invalid radix-10 number 예외 발생
                      textBearController.runFailAnimation();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}