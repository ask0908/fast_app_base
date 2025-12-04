import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
        (ref) => FloatingButtonStateNotifier(const FloatingButtonState(false, false)));

// notifier는 FloatingButtonState가 바뀌는지 알려줘야 해서 클래스로 만듬
class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  // 같은 state 객체를 넘길 때 notifier 입장에서 state가 바뀐 걸 알려주는 함수
  // state 할당 시 새로 넘기는 state, 기존 state 값을 비교
  @override
  bool updateShouldNotify(FloatingButtonState old, FloatingButtonState current) {
    // 지금은 old, current 모두 같은 메모리의 객체인데 변수 하나 바꾸고 비교하라고 하면
    // 결국 같은 객체를 비교하는 거라 notifier에 알려줄 필요 없음 -> 무조건 바뀌었다고 알려주기 위해 편법으로 true 리턴
    // return true;
    // 실제 사용법
    return super.updateShouldNotify(old, current);
  }

  bool needToMakeButtonBigger = false;

  void onTapButton() {
    // 둘 다 바뀌기 때문에 copyWith 안 씀
    // state = state.copyWith(isExpanded: !state.isExpanded, isSmall: true);
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;

    state = state.copyWith(isExpanded: !state.isExpanded, isSmall: needToMakeButtonBigger ? false : true);

    if (needToMakeButtonBigger) {
      needToMakeButtonBigger = false;
    }

    if (!isSmall && !isExpanded) {
      needToMakeButtonBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    state = state.copyWith(isSmall: isSmall);
  }
}