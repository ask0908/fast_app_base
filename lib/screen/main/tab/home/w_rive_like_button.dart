import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLikeButton extends StatefulWidget {

  // 상위에서 주입되는 bool 처리하기 위해 final 설정
  final bool isLike;
  final void Function(bool isLike) onTapLike;

  const RiveLikeButton(this.isLike, {super.key, required this.onTapLike});

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {

  // onInit 호출 시 초기화
  late StateMachineController controller;

  // SMI : StateMachineInput
  late SMIBool smiPressed;
  late SMIBool smiHover;

  // like 버튼이 쓰이는 화면에서 build()가 일어날 때 호출 -> setState 호출 시 build
  // build가 호출되면서 값이 바뀌는 걸 캐치하기 위해 사용
  @override
  void didUpdateWidget(covariant RiveLikeButton oldWidget) {
    if (oldWidget.isLike != widget.isLike) {
      smiPressed.value = widget.isLike;
      smiHover.value = widget.isLike;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        widget.onTapLike(!widget.isLike);
      },
      child: RiveAnimation.asset(
        "$baseRivePath/light_like.riv",
        stateMachines: ["State Machine 1"],
        onInit: (Artboard art) {
          // fromArtboard()가 static 함수라 ! 써야 함
          controller = StateMachineController.fromArtboard(art, "State Machine 1")!;
          controller.isActive = true;
          art.addController(controller);

          // 값 가져오는데 타입 제네릭 써야 하고 강제 캐스팅도 해야 하는 훌륭한 라이브러리
          smiPressed = controller.findInput<bool>("Pressed") as SMIBool;
          smiHover = controller.findInput<bool>("Hover") as SMIBool;
        },
      ),
    );
  }
}