import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:flutter/cupertino.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>> {
  // 처음에 앱 키면 비어있을 거라 빈 리스트로 초기화
  TodoDataNotifier() : super([]);

  void addTodo(Todo todo) {
    // value = ValueNotifier 제네릭 타입
    value.add(todo);

    // notifier가 쓰이는 곳에 데이터 변경 알림
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}