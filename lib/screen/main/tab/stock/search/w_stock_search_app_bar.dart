import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {

  final TextEditingController controller;

  const StockSearchAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            Tap(
              onTap: () => Nav.pop(context),
              child: const SizedBox(
                width: 56,
                height: kToolbarHeight,
                child: Arrow(
                  direction: AxisDirection.left,
                ),
              ),
            ),
            Expanded(
              child: TextFieldWithDelete(
                controller: controller,
                texthint: "'커피'를 검색해보세요",
                textInputAction: TextInputAction.search,
                onEditingComplete: () {
                  debugPrint("검색 확인버튼");
                  AppKeyboardUtil.hide(context); // 커스텀 구현 시 추가하면 검색 클릭 시 키보드 사라짐
                },
              ).pOnly(top: 6),
            ),
            width20,
          ],
        ),
      ),
    );
  }

  // kToolbarHeight : 플러터에서 기본으로 정한 크기
  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}