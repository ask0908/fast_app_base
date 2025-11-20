import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

// ConsumerWidget :
class TodoList extends ConsumerWidget {
  TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read : 한 번만 읽음, watch : 계속 관찰
    final todoList = ref.watch(todoDataProvider);

    return todoList.isEmpty
        ? "할 일을 작성해 보세요".text.size(30).makeCentered()
        : Column(
            children: todoList.map((e) => TodoItem(e)).toList(),
          );
  }
}
