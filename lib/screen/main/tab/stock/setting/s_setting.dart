import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "설정".text.make(),
      ),
      body: ListView(
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
        ],
      ),
    );
  }
}