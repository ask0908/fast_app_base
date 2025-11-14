main() {
  // String content = "과일들 : ";
  //
  // // 초기값 없어도 됨
  // StringBuffer sb = StringBuffer(content);
  // // write : String 이어붙임
  // // writeln : 개행문자 추가
  // sb.writeAll(["사과", "오렌지", "수박", "체리"], ", ");
  // print(sb.toString());

  // final findNumberRegExp = RegExp(r"\d+");
  // const example = "https://api.dart.dev/stable/3.0.6/dart-core.html?param1=good&param2=33&param3=22.4";
  //
  // final matches = findNumberRegExp.allMatches(example);
  // for (final match in matches) {
  //   final matchedString = example.substring(match.start, match.end);
  //   print(matchedString);
  // }

  // final findHashTagRegExp = RegExp(r"(#[\d|A-Z|a-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*)");
  // const hashContent = "문장에 #해시 #태그를 찾아주세요. #플러터";
  //
  // final hashMatches = findHashTagRegExp.allMatches(hashContent);
  // for (final match in hashMatches) {
  //   final matchedString = hashContent.substring(match.start, match.end);
  //   print(matchedString);
  // }

  const example = "https://api.dart.dev/stable/3.0.6/dart-core.html?param1=good&param2=33&param3=22.4";
  final uri = Uri.parse(example);

  print(uri.scheme);
  print(uri.host);
  print(uri.path);

  for (final pathSegment in uri.pathSegments) {
    print(pathSegment);
  }

  final params = uri.queryParametersAll;
  final param4 = params["param3"];
  print(param4);
}