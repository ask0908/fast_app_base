import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class AppKeyboardUtil {
  static void hide(BuildContext context) {
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void show(BuildContext context, FocusNode node) {
    FocusScope.of(context).unfocus();
    Timer(const Duration(milliseconds: 1), () {
      FocusScope.of(context).requestFocus(node);
    });
  }
}

mixin KeyboardDetector<T extends StatefulWidget> on State<T> {
  bool isKeyboardOn = false;
  final bool useDefaultKeyboardDetectorInit = true;

  @override
  void initState() {
    super.initState();
    if (useDefaultKeyboardDetectorInit) {
      initKeyboardDetector();
    }
  }

  @override
  void dispose() {
    disposeKeyboardDetector();
    super.dispose();
  }

  void initKeyboardDetector({
    final Function(double)? willShowKeyboard,
    final Function()? willHideKeyboard,
  }) {
    // WidgetsBinding을 사용한 키보드 감지
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkKeyboard(willShowKeyboard, willHideKeyboard);
    });
  }

  void _checkKeyboard(
      Function(double)? willShowKeyboard,
      Function()? willHideKeyboard,
      ) {
    final mediaQuery = MediaQuery.of(context);
    final viewInsets = mediaQuery.viewInsets;
    final keyboardHeight = viewInsets.bottom;

    if (keyboardHeight > 0 && !isKeyboardOn) {
      // 키보드가 올라옴
      isKeyboardOn = true;
      if (willShowKeyboard != null) {
        willShowKeyboard(keyboardHeight);
      }
      if (mounted) setState(() {});
    } else if (keyboardHeight == 0 && isKeyboardOn) {
      // 키보드가 내려감
      isKeyboardOn = false;
      if (willHideKeyboard != null) {
        willHideKeyboard();
      }
      if (mounted) setState(() {});
    }
  }

  void disposeKeyboardDetector() {
    // 필요한 정리 작업
  }
}