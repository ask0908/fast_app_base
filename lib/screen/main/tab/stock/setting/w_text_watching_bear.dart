import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TextWatchingBearController {
  late void Function() runSuccessAnimation;
  late void Function() runFailAnimation;
}

class TextWatchingBear extends StatefulWidget {
  // 상위에서 주입되는 bool 처리하기 위해 final 설정
  final bool check;
  final bool handsUp;
  final double look;
  final TextWatchingBearController controller;

  const TextWatchingBear({
    super.key,
    required this.check,
    required this.handsUp,
    required this.look,
    required this.controller,
  });

  @override
  State<TextWatchingBear> createState() => _TextWatchingBearState();
}

class _TextWatchingBearState extends State<TextWatchingBear> {
  // onInit 호출 시 초기화
  late StateMachineController controller;

  // SMI : StateMachineInput
  late SMIBool smiCheck;
  late SMIBool smiHandsUp;
  late SMINumber smiLook;
  late SMITrigger smiSuccess;
  late SMITrigger smiFail;

  @override
  void initState() {
    widget.controller.runSuccessAnimation = () {
      smiSuccess.fire();
    };

    widget.controller.runFailAnimation = () {
      smiFail.fire();
    };
    super.initState();
  }

  // like 버튼이 쓰이는 화면에서 build()가 일어날 때 호출 -> setState 호출 시 build
  // build가 호출되면서 값이 바뀌는 걸 캐치하기 위해 사용
  @override
  void didUpdateWidget(covariant TextWatchingBear oldWidget) {
    if (oldWidget.check != widget.check) {
      smiCheck.value = widget.check;
    }

    if (oldWidget.handsUp != widget.handsUp) {
      smiHandsUp.value = widget.handsUp;
    }

    if (oldWidget.look != widget.look) {
      smiLook.value = widget.look;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      "$baseRivePath/login_screen_character.riv",
      stateMachines: ["State Machine 1"],
      onInit: (Artboard art) {
        // fromArtboard()가 static 함수라 ! 써야 함
        controller =
            StateMachineController.fromArtboard(art, "State Machine 1")!;
        controller.isActive = true;
        art.addController(controller);

        // 값 가져오는데 타입 제네릭 써야 하고 강제 캐스팅도 해야 하는 훌륭한 라이브러리
        smiCheck = controller.findInput<bool>("Check") as SMIBool;
        smiHandsUp = controller.findInput<bool>("hands_up") as SMIBool;
        smiLook = controller.findInput<double>("Look") as SMINumber;
        smiSuccess = controller.findInput<bool>("success") as SMITrigger;
        smiFail = controller.findInput<bool>("fail") as SMITrigger;
      },
    );
  }
}