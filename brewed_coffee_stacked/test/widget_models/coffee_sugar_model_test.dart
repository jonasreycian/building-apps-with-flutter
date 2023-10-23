import 'package:flutter_test/flutter_test.dart';
import 'package:brewed_coffee_stacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CoffeeSugarModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
