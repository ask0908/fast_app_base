import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            "인기 검색".text.bold.make(),
            emptyExpanded,
            "오늘 ${DateTime.now().formattedTime} 기준".text.size(12).make(),
          ],
        ),
        height20,
        // 1~5를 표현해야 한다. 더미 데이터엔 없는 데이터라 순서를 표현하기 위해 mapIndexed 사용
        ...popularStockList
            .mapIndexed((e, i) => PopularStockItem(stock: e, number: i + 1))
            .toList(),
      ],
    ).pSymmetric(h: 20);
  }
}
