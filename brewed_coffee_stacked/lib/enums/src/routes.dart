import 'package:flutter/foundation.dart';

enum AppRouteEnum {
  cart,
  coffeeItem,
  forgotPassword,
  home,
  loginViaEmail,
  login,
  menuDetail,
  menuList,
  menu,
  orders,
  profile,
  register,
  splash;

  const AppRouteEnum();

  String get name => describeEnum(this);
}
