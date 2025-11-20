import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screen/main/write/d_write_todo.dart';

final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>((ref) => TodoDataHolder());

class TodoDataHolder extends StateNotifier<List<Todo>> {
  TodoDataHolder(): super([]);

  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("정말로 처음 상태로 변경하시겠어요?").show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
    }

    // 데이터 바꾸고 state에 새 값을 담으면 GetX의 refresh와 같은 효과
    state = List.of(state);
  }

  void addTodo() async {
    // api 통신, 시간 걸리는 작업 중 메인 화면이 사라지거나 컨텍스트가 유효하지 않게 될 수 있음
    // mounted 여부 확인 추가했지만 여기선 다이얼로그가 뜨고 사라졌을 때 state가 mounted된 게
    // 흐름상 보장되기 때문에 제거
    final result = await WriteTodoDialog().show();
    if (result != null) {
      state.add(
          Todo(
            id: DateTime.now().millisecondsSinceEpoch,
            title: result.text,
            dueDate: result.dateTime,
          )
      );

      state = List.of(state);
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      state = List.of(state);
    }
  }

  void remove(Todo todo) {
    state.remove(todo);
    state = List.of(state);
  }
}

extension TodoListHolderProvider on WidgetRef {
  TodoDataHolder get readTodoHolder => read(todoDataProvider.notifier);
}