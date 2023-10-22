import 'package:flutter/foundation.dart';

enum UserRoleEnum {
  customer,
  admin,
  unknown;

  const UserRoleEnum();

  String get name => describeEnum(this);
}
