class SimpleStock {
  final String stockName;

  SimpleStock(this.stockName);

  // json 객체를 통해 객체를 새로 생성하기 때문에 factory 키워드 사용
  // factory : 생성자와 비슷, 가변 파라미터를 갖고 필요한 생성자를 호출해 그 객체 리턴
  factory SimpleStock.fromJson(dynamic json) {
    return SimpleStock(json["name"]);
  }
}