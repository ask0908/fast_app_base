import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:get/get.dart';

import '../../screen/main/write/d_write_todo.dart';

class TodoDataHolder extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;

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

    // rx 변수를 관찰하는 obx 위젯 내부적으로 재빌드
    todoList.refresh();
    // w_todo_list에서 GetBuilder 사용하려면 추가
    // refresh() 호출하고 갱신하려면 호출, GetxController 업데이트
    update();
  }

  void addTodo() async {
    // api 통신, 시간 걸리는 작업 중 메인 화면이 사라지거나 컨텍스트가 유효하지 않게 될 수 있음
    // mounted 여부 확인 추가했지만 여기선 다이얼로그가 뜨고 사라졌을 때 state가 mounted된 게
    // 흐름상 보장되기 때문에 제거
    final result = await WriteTodoDialog().show();
    if (result != null) {
      todoList.add(
          Todo(
            id: DateTime.now().millisecondsSinceEpoch,
            title: result.text,
            dueDate: result.dateTime,
          )
      );

      update();
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      todoList.refresh();
      update();
    }
  }

  void remove(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
    update();
  }
}

mixin class TodoDataProvider {
  late final TodoDataHolder todoData = Get.find();
}