import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:get/get.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

/// Get에서 데이터 상태를 들고 있기 위한 컨트롤러
class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];

  // 동적으로 리스트가 바뀔 때마다 화면에 자동으로 그리기 위한 리스트
  // 사용 시 observation 확장 함수 사용, 리스트 앞에 타입 제네릭 명시해야 함
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  // GetX 컨트롤러가 최초 생성될 때 호출
  @override
  void onInit() {
    searchHistoryList.addAll(["삼성전자", "LG전자", "현대차", "넷플릭스"]);
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    // file path로 json string을 가져오고 디코딩 > 원하는 객체 형태로 변환
    final jsonList =
        await LocalJson.getObjectList<SimpleStock>("json/stock_list.json");
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }

    autoCompleteList.value =
        stocks.where((e) => e.name.contains(keyword)).toList();
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  void removeHistory(String stockName) {
    searchHistoryList.remove(stockName);
  }
}