import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TtosAppBar extends StatefulWidget {

  static const double appBarHeight = 60;

  const TtosAppBar({super.key});

  @override
  State<TtosAppBar> createState() => _TtosAppBarState();
}

class _TtosAppBarState extends State<TtosAppBar> {
  bool _showRedDot = false;
  int _tappingCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtosAppBar.appBarHeight,
      color: context.appColors.appBarBackground,
      child: Row(
        children: [
          width10,
          // AnimatedContainer(
          //   duration: 1000.ms,
          //   curve: Curves.easeIn,
          //   height: _tappingCount < 2 ? 60 : 30,
          //   child: Image.asset(
          //     "$basePath/icon/toss.png",
          //     // height: 30, // Image는 Container로 싸여 있으면 내부 속성이 작동 안 함
          //   ),
          // ),
          AnimatedCrossFade(
            firstChild: Image.asset(
              "$basePath/icon/toss.png",
              height: 30,
            ),
            secondChild: Image.asset(
              "$basePath/icon/map_point.png",
              height: 30,
            ),
            crossFadeState: _tappingCount < 2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: 1500.ms,
          ),
          emptyExpanded,
          Tap(
            onTap: () {
              setState(() {
                _tappingCount++;
              });
            },
            child: Image.asset(
              "$basePath/icon/map_point.png",
              height: 30,
            ),
          ),
          width10,
          Tap(
            onTap: () {
              // 알림 화면
              Nav.push(NotificationScreen());
            },
            child: Stack(
              children: [
                Image.asset(
                  "$basePath/icon/notification.png",
                  height: 30,
                ),
                if (_showRedDot) Positioned.fill(
                  child: Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red
                      ),
                    ),
                  ),
                ),
              ],
            ).animate(
              onComplete: (controller) => controller.repeat()
            ),
          ),
          width10,
        ],
      ),
    );
  }
}