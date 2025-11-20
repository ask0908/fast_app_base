import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/data/memory/app_bloc/app_bloc_observer.dart';
import 'package:fast_app_base/data/memory/app_bloc/app_event_transformer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);
  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();
  timeago.setLocaleMessages('ko', timeago.KoMessages());

  // static observer 객체에 커스텀 옵저버 넣으면 앱에서 발생하는 모든 이벤트의 변화 관찰 가능
  Bloc.observer = AppBlocObserver();
  // Bloc.transformer = appEventTransformer(events, mapper);

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App()));
}