import 'package:fast_app_base/data/memory/bloc/todo_event.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("onChange");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("onClose");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("onCreate");
  }

  @override
  void onDone(Bloc bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    debugPrint("onDone");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("onError");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("onEvent");
    if (event is TodoEvent) {
      switch (event) {
        case TodoRemoveEvent() :
          debugPrint("removed event");

        case TodoContentUpdateEvent() :
          debugPrint("content update event");

        case TodoStatusUpdateEvent() :
          debugPrint("status update event");

        case TodoAddEvent() :
          debugPrint("add event");
      }
    } else {
      debugPrint("not TodoEvent : $event");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("onTransition");
  }

}