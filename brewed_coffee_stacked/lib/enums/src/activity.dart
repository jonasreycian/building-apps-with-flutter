import 'package:flutter/foundation.dart';

enum ActivityEnum {
  login,
  addToCart,
  placeOrder,
  logout;

  const ActivityEnum();

  String get name => describeEnum(this);
}
