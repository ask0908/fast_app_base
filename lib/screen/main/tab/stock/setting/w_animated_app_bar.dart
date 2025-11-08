import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController controller;
  
  const AnimatedAppBar(this.title, {super.key, required this.controller});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {

  // 필요할 때 게터가 값을 가져옴
  Duration get duration => 10.ms;
  double scrollPosition = 0;
  bool get isTriggered => scrollPosition > 80;
  bool get isNotTriggered => !isTriggered;

  // initial : 가장 상단에 있을 때 목표하는 타겟점
  // target : 트리거됐을 때 동작하는 파라미터
  double getValue(double initial, double target) {
    // scrollPosition이 이미 타겟팅 범위 넘었으면
    if (isTriggered) {
      return target;
    }

    // 왜 스크롤 포지션이 0~80까지?
    double fraction = scrollPosition / 80;

    return initial + (target - initial) * fraction;
  }

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        scrollPosition = widget.controller.position.pixels;
      });
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: const Arrow(
                direction: AxisDirection.left,
              ),
            ).p20(),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(
                left: getValue(20, 50),
                top: getValue(50, 15),
              ),
              child: AnimatedDefaultTextStyle( // 움직이는 텍스트 표현 시 사용
                duration: duration,
                style: TextStyle(
                  fontSize: isNotTriggered ? 30 : 18,
                  fontWeight: FontWeight.bold,
                ),
                child: widget.title.text.color(Colors.black).make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}