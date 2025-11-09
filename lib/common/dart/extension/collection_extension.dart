extension ListExtension<T> on List<T> {
  void swap(int origin, int target) {
    final temp1 = this[target];
    this[target] = this[origin];
    this[origin] = temp1;
  }

  // Stream<T> toStream() => Stream.fromIterable(this);

  // 위와 같은 역할
  Stream<T> toStream() async* {
    for (T item in this) {
      yield item;
    }
  }
}
