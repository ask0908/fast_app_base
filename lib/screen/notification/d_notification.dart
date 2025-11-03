import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NotificationDialog extends DialogWidget {
  final List<TtosNotification> notifications;

  NotificationDialog(
    this.notifications, {
    super.key,
    super.animation = NavAni.Bottom, // 바텀 시트 표시 애니메이션
  });

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.notifications
              .map(
                (e) => NotificationItemWidget(
                  notification: e,
                  onTap: () {
                    // widget = NotificationDialog
                    // hide는 강사가 만든 함수
                    widget.hide();
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
