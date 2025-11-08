import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {

  final scrollController = ScrollController();
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: 2000.ms,
  );

  @override
  void initState() {
    animationController.addListener(() {
      final status = animationController.status;
      switch(status) {
        case AnimationStatus.dismissed:
          // TODO: Handle this case.
          throw UnimplementedError();
        case AnimationStatus.forward:
          // TODO: Handle this case.
          throw UnimplementedError();
        case AnimationStatus.reverse:
          // TODO: Handle this case.
          throw UnimplementedError();
        case AnimationStatus.completed:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: const EdgeInsets.only(
              top: 150
            ),
            children: [
              Obx(
                    () => SwitchMenu(
                  "푸시 설정",
                  Prefs.isPushOnRx.get(),
                  onChanged: (bool isOn) {
                    Prefs.isPushOnRx.set(isOn);
                  },
                ),
              ),
              Obx(() => Slider(
                value: Prefs.sliderPosition.get(),
                onChanged: (value) {
                  animationController.animateTo(
                    value,
                    duration: 0.ms,
                  );
                  Prefs.sliderPosition.set(value);
                  // Prefs.sliderPosition(value); // 위 코드와 같은 효과
                },
              )),
              Obx(
                    () => BigButton(
                  "날짜 : ${Prefs.birthDay.get() == null ? "" : Prefs.birthDay.get()?.formattedDate}",
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days),
                    );

                    if (date != null) {
                      Prefs.birthDay.set(date);
                    }
                  },
                ),
              ),
              Obx(
                    () => BigButton(
                  "저장된 숫자 : ${Prefs.number.get()}",
                  onTap: () async {
                    final number = await NumberDialog().show();

                    if (number != null) {
                      Prefs.number.set(number);
                    }
                  },
                ),
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "애니메이션 forward",
                onTap: () async {
                  animationController.forward();
                },
              ),
              BigButton(
                "애니메이션 reverse",
                onTap: () async {
                  animationController.reverse();
                },
              ),
              BigButton(
                "애니메이션 repeat",
                onTap: () async {
                  animationController.repeat();
                },
              ),
              BigButton(
                "애니메이션 reset",
                onTap: () async {
                  animationController.reset();
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                "오픈소스 화면",
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
            ],
          ),
          AnimatedAppBar(
            "설정",
            scrollController: scrollController,
            animationController: animationController,
          ),
        ],
      ),
    );
  }
}