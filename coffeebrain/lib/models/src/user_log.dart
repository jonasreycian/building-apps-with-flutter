import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/enums.dart';
import 'date_time_converter.dart';

part 'user_log.freezed.dart';
part 'user_log.g.dart';

@freezed
class UserLog with _$UserLog {
  @DateTimeConverter()
  const factory UserLog({
    String? id,
    required Activity activity,
    required DateTime created,
    required String userId,
  }) = _UserLog;

  factory UserLog.fromJson(Map<String, dynamic> json) =>
      _$UserLogFromJson(json);
}
