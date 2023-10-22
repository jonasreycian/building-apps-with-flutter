import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:brewedcoffee/app/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_log.freezed.dart';
part 'user_log.g.dart';

@freezed
class UserLog with _$UserLog {
  @DateTimeConverter()
  const factory UserLog({
    required ActivityEnum activity,
    required DateTime created,
    required String userId,
    String? id,
  }) = _UserLog;

  factory UserLog.fromJson(Map<String, dynamic> json) =>
      _$UserLogFromJson(json);
}
