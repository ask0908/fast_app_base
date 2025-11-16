import 'package:fast_app_base/data/memory/todo_status.dart';

class Todo {
  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime dueDate;
  TodoStatus status;

  // createTime은 생성자 호출 시점에 만들어지면 되서 콜론으로 변수에 따로 할당
  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.status = TodoStatus.incomplete,
  }) : createdTime = DateTime.now();
}