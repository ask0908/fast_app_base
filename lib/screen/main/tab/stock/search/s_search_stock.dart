import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_search_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> {

  final TextEditingController controller = TextEditingController();

  // 이 화면이 최초 생성될 때 GetX를 상속하는 데이터가 등록돼야 함
  // 일반적으로 initState 안에서 Get.put() 사용
  @override
  void initState() {
    Get.put(SearchStockData());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchStockData>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(
        controller: controller,
      ),
      body: ListView(
        children: [
          // 300개 이상 많은 아이템을 표현할 땐 ListView.builder를 쓰는 게 좋은데 지금은 몇 개 없어서 children 사용
          // 많은 아이템을 children으로 처리하면 성능 이슈
          SearchHistoryStockList(),
          PopularSearchStockList(),
        ],
      ),
    );
  }
}