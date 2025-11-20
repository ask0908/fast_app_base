import 'package:fast_app_base/data/memory/vo_todo.dart';

// abstract 대신 sealed 사용 가능. dart3 신기능
// app_bloc_observer.dart의 switch에서 case가 누락되면 바로 컴파일 에러
// TodoEvent를 상속한 클래스 관련 처리를 전부 구현하게 강제
sealed class TodoEvent {}

class TodoAddEvent extends TodoEvent {}

class TodoStatusUpdateEvent extends TodoEvent {
  final Todo updatedTodo;

  TodoStatusUpdateEvent(this.updatedTodo);
}

class TodoContentUpdateEvent extends TodoEvent {
  final Todo updatedTodo;

  TodoContentUpdateEvent(this.updatedTodo);
}

class TodoRemoveEvent extends TodoEvent {
  final Todo removedTodo;

  TodoRemoveEvent(this.removedTodo);
}