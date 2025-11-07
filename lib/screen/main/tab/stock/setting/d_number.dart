import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';
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
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                "숫자를 입력하시오".text.color(Colors.white).make(),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                ),
                RoundButton(
                  text: "완료",
                  onTap: () {
                    final text = controller.text;
                    int number = int.parse(text);

                    // 닫을 때 숫자를 넘겨야 다이얼로그 띄운 쪽에서 받을 수 있음
                    widget.hide(number);
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