import 'package:fast_app_base/screen/main/tab/stock/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';

class PopularStock extends SimpleStock with StockPercentageDataProvider {
  // yesterdayClosePrice, currentPrice가 있는 객체에선 StockPercentageDataProvider에서 제공하는 함수 사용 가능
  @override
  final int yesterdayClosePrice;

  @override
  final int currentPrice;

  PopularStock({
    required String stockName,
    required this.yesterdayClosePrice,
    required this.currentPrice,
  }) : super(stockName);
}
