import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, FieldValue> {
  const DateTimeConverter();

  @override
  DateTime fromJson(FieldValue json) => DateTime.parse(json.toString());

  @override
  FieldValue toJson(DateTime object) => FieldValue.serverTimestamp();
}
