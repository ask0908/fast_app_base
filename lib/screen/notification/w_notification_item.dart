import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/provider/notification_provider.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends ConsumerStatefulWidget {
  final DaangnNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  ConsumerState<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends ConsumerState<NotificationItemWidget> {
  static const double leftPadding = 10;
  static const double iconWidth = 25;

  @override
  Widget build(BuildContext context) {
    final isEditMode = ref.watch(notificationEditModeProvider);

    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        color: widget.notification.isRead
            ? context.backgroundColor
            : context.appColors.unreadColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                Expanded(child: widget.notification.title.text.bold.make()),
                if (isEditMode) IconButton(
                  onPressed: () {
                    // 아이템 안에 있고 더미 데이터 쓰기 때문에 ! 사용
                    // 실제면 list에 null 체크 걸어야 함
                    final list = ref.read(notificationProvider)!;
                    list.remove(widget.notification);
                    // 다른 객체 넘기기 위해 List.of()로 새 리스트 객체 생성
                    ref.read(notificationProvider.notifier).state = List.of(list);
                  },
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
            height10,
            widget.notification.description.text
                .color(context.appColors.lessImportantColor)
                .make()
                .pOnly(
                  left: leftPadding + iconWidth,
                ),
            height10,
            timeago
                .format(
                  widget.notification.time,
                  // locale.languageCode : 앱에 설정된 locale 따라 언어 변경
                  locale: context.locale.languageCode,
                )
                .text
                .size(13)
                .color(context.appColors.lessImportantColor)
                .make()
                .pOnly(
                  left: leftPadding + iconWidth,
                ),
          ],
        ),
      ),
    );
  }
}
