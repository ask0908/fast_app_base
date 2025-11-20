import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screen/main/write/d_write_todo.dart';

// dart run build_runner build 명령어 실행 시 Cubit 제네릭 타입에 XXXBlocState 안 쓰면 빌드 실패
// 처음부터 써놓고 하기
class TodoCubit extends Cubit<TodoBlocState> {

  // app.dart의 BlocProvider에서 create로 TodoCubit을 생성해서 넘겨야 하는데
  // 생성자 파라미터가 필요없게 내부에서 초기화하게 수정
  TodoCubit() : super(const TodoBlocState(BlocStatus.initial, <Todo>[]));

  void addTodo() async {
    // api 통신, 시간 걸리는 작업 중 메인 화면이 사라지거나 컨텍스트가 유효하지 않게 될 수 있음
    // mounted 여부 확인 추가했지만 여기선 다이얼로그가 뜨고 사라졌을 때 state가 mounted된 게
    // 흐름상 보장되기 때문에 제거
    final result = await WriteTodoDialog().show();
    if (result != null) {
      // cubit 안에 Bloc State가 들어 있고 그 안에 todoList가 들어 있음
      // todoList는 불변 리스트 -> 바꾸려면 새 상태 만들어서 bloc 패키지에 바뀐 state를 보내야 함
      // List.of()로 감싸면 가변 리스트로 바뀜
      final copiedOldTodoList = List.of(state.todoList);

      copiedOldTodoList.add(
          Todo(
            id: DateTime.now().millisecondsSinceEpoch,
            title: result.text,
            dueDate: result.dateTime,
            createdTime: DateTime.now(), // 생성자가 바뀌어 createdTime, status 추가
            status: TodoStatus.incomplete,
          )
      );

      // cubit 내재 함수. 새 state를 보내야 해서 state.copyWith 사용
      emitNewList(copiedOldTodoList);
    }
  }

  void changeTodoStatus(Todo todo) async {
    final copiedOldTodoList = List.of(state.todoList);
    final todoIndex = copiedOldTodoList.indexWhere((e) => e.id == todo.id);
    TodoStatus status = todo.status;

    switch (todo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("정말로 처음 상태로 변경하시겠어요?").show();
        result?.runIfSuccess((data) {
          status = TodoStatus.incomplete;
        });
    }

    copiedOldTodoList[todoIndex] = todo.copyWith(status: status);

    emitNewList(copiedOldTodoList);
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      // 넘어온 투두 객체 위치 파악해서 해당 pos에 설정
      final copiedOldTodoList = List<Todo>.from(state.todoList);
      copiedOldTodoList[copiedOldTodoList.indexOf(todo)] = todo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
        modifyTime: DateTime.now(),
      );

      emitNewList(copiedOldTodoList);
    }
  }

  void remove(Todo todo) {
    final copiedOldTodoList = List<Todo>.from(state.todoList);
    copiedOldTodoList.removeWhere((e) => e.id == todo.id);
    emitNewList(copiedOldTodoList);
  }

  void emitNewList(List<Todo> copiedOldTodoList) {
    emit(state.copyWith(todoList: copiedOldTodoList));
  }
}