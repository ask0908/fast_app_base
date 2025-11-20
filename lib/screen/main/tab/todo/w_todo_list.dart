import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
class TodoList extends StatelessWidget with TodoDataProvider {
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    // GetView 쓰면 todoData 대신 controller로 컨트롤러에 접근 가능
    // Obx로 감싸야 함
    // GetView는 비추. GetView를 상속하면 다른 뷰를 상속해야 할 때 GetView를 없애야 하고
    // 지금은 컨트롤러 하나만 쓰지만 나중에 유저 데이터나 여러 컨트롤러를 참조할 때
    // Get.find()로 가져와야 함 -> 컨트롤러, Get.find()를 사용하는 기준이 깨질 수 있음
    // 그래서 GetView 사용 비추
    return Obx(() => todoData.todoList.isEmpty
        ? "할 일을 작성해 보세요".text.size(30).makeCentered()
        : Column(
            children: todoData.todoList.map((e) => TodoItem(e)).toList(),
          ));
  }
}
