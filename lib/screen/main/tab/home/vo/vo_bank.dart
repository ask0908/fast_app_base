class Bank {
  final String name;
  final String logoImagePath;

  Bank(this.name, this.logoImagePath);

  @override
  String toString() {
    return "name : $name, logoImagePath : $logoImagePath";
  }

  // "ope" 타이밍 > "==" 선택
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is Bank && other.name == name;
  }
}