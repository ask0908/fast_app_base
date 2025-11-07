import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';

/// 이 위젯이 스스로 값을 바꾸는 건 아니라 stateless로 만듬
class SearchAutoCompleteList extends StatelessWidget with SearchStockDataProvider {
  final TextEditingController controller;

  // const 쓰면 late, const에 컴파일 에러 발생
  // 이 클래스엔 상수 생성자밖에 없음 = 초기화될 때 모든 게 결정돼야 함
  // late는 생성될 때 초기화되지 않아 에러 발생 -> const 지워서 일반 생성자로 바꿈
  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = searchData.autoCompleteList[index].name;

        return Tap(
          onTap: () {
            controller.clear();
            searchData.addHistory(stock);
            Nav.push(StockDetailScreen(stockName));
          },
          child: stockName.text.make().p(20),
        );
      },
      itemCount: searchData.autoCompleteList.length,
    );
  }
}