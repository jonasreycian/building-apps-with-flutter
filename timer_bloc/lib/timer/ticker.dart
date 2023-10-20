class Ticker {
  const Ticker();

  Stream<int> tick({int ticks = 1}) {
    return Stream.periodic(1.seconds, (x) => ticks - x - 1).take(ticks);
  }
}

extension GetInt on int {
  Duration get seconds => Duration(seconds: this);
}
