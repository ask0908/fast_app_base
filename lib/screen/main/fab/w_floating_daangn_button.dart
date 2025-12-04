import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/animated_width_collapse.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingDaangnButton extends ConsumerWidget {
  // 성능이 중요한 많이 쓰이는 위젯에선 생성자에 const 빼지 말기
  FloatingDaangnButton({super.key});

  final duration = 300.ms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;

    return Stack(
      children: [
        IgnorePointer( // 모든 제스처 무시
          ignoring: !isExpanded, // fab가 확장 상태가 아닐 때만 스크롤되게
          child: AnimatedContainer(
            duration: duration,
            color:
                isExpanded ? Colors.black.withOpacity(0.3) : Colors.transparent,
          ),
        ),
        // 인강 코드대로 짜면 A RenderFlex overflowed by 32 pixels on the bottom 에러 발생해서 구조 수정
        // Positioned 대신 Align 사용 + ConstrainedBox로 높이 제한
        Align(
          alignment: Alignment.bottomRight,
          child: ConstrainedBox(
            // Column이 화면 높이를 초과하지 않게 제한
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  50,
            ),
            child: SingleChildScrollView(
              child: Column(
                // fab 위에 표시되게 column 크기 최소, 오른쪽 정렬
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    opacity: isExpanded ? 1 : 0,
                    duration: duration,
                    child: Container(
                      width: 160,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(
                        right: 15,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                          color: context.appColors.floatingActionLayer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _floatItem("알바", "$basePath/fab/fab_01.png"),
                          _floatItem("과외/클래스", "$basePath/fab/fab_02.png"),
                          _floatItem("농수산물", "$basePath/fab/fab_03.png"),
                          _floatItem("부동산", "$basePath/fab/fab_04.png"),
                          _floatItem("중고차", "$basePath/fab/fab_05.png"),
                        ],
                      ),
                    ),
                  ),
                  Tap(
                    onTap: () {
                      ref.read(floatingButtonStateProvider.notifier).onTapButton();
                    },
                    child: AnimatedContainer(
                      duration: duration,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: isExpanded
                            ? context.appColors.floatingActionLayer
                            : const Color(0xFFFF791F),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        // 최대 길이를 차지할 필요 없어서 min 설정
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedRotation(
                            child: Icon(Icons.add),
                            turns: isExpanded ? 0.125 : 0,
                            duration: duration,
                          ),
                          AnimatedWidthCollapse(
                            visible: !isSmall,
                            duration: duration,
                            child: "글쓰기".text.make(),
                          )
                        ],
                      ),
                    ).pOnly(
                        // viewPaddingBottom 게터는 강사가 만듬
                        bottom: MainScreenState.bottomNavigationBarHeight +
                            context.viewPaddingBottom +
                            10,
                        right: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _floatItem(String title, String imagePath) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 30,
        ),
        const Width(8),
        title.text.make(),
      ],
    );
  }
}