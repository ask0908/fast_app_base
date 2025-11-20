import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// GetX에서 컨트롤러 참조하는 다른 방법 = GetBuilder
// class TodoList extends StatelessWidget {
//   const TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // GetView처럼 한 컨트롤러만 받을 수 있어서 확장성 면에서 떨어짐
//     // 가독성도 Obx보다 안 좋다는 강사 의견
//     return GetBuilder<TodoDataHolder>(
//       builder: (todoData) {
//         return todoData.todoList.isEmpty
//             ? "할 일을 작성해 보세요".text.size(30).makeCentered()
//             : Column(
//                 children: todoData.todoList.map((e) => TodoItem(e)).toList(),
//               );
//       },
//     );
//   }
// }

// notifier가 데이터를 들고 있어서 이 위젯은 stateless
// StatelessWidget 대신 GetView 사용 가능
class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoBlocState>(
      builder: (context, state) {
        return state.todoList.isEmpty
            ? "할 일을 작성해 보세요".text.size(30).makeCentered()
            : Column(
                children: state.todoList.map((e) => TodoItem(e)).toList(),
              );
      },
    );
  }
}
