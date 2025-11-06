import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';

abstract mixin class StockPercentageDataProvider {

  /// double은 nullable이 아니라 초기화해야 함
  /// late를 쓰는 법도 있지만 임시방편
  /// 클래스를 abstract로 만들어서 게터가 존재한다고 가정한다
  int get currentPrice;
  int get yesterdayClosePrice;

  // 모델 클래스의 역할은 데이터를 들고 있고 전달하는 것이지 계산, 로직 함수를 잘 넣지 않음
  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100)
          .toPrecision(2);

  bool get isPlus => currentPrice > yesterdayClosePrice;

  bool get isSame => currentPrice == yesterdayClosePrice;

  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isSame
      ? ""
      : isPlus
      ? "+"
      : "-";

  String get todayPercentageString => "$symbol$todayPercentage%";

  Color getPriceColor(BuildContext context) => isSame
      ? context.appColors.lessImportant
      : isPlus
      ? context.appColors.plus
      : context.appColors.minus;
}