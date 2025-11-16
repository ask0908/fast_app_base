import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';

// notifier가 데이터를 들고 있어서 이 위젯은 stateless
class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.holder.notifier,
      // todoList : notifier 안의 value 값이 그대로 넘어옴
      builder: (context, todoList, child) {
        return todoList.isEmpty
            ? "할 일을 작성해 보세요".text.size(30).makeCentered()
            : Column(
                children: todoList.map((e) => TodoItem(e)).toList(),
              );
      },
    );
  }
}