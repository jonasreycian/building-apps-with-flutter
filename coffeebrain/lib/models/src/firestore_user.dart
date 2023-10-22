import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wiredbrain/enums/enums.dart';

part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
class FirestoreUser with _$FirestoreUser {
  const FirestoreUser._();

  const factory FirestoreUser({required List<UserRole> roles}) = _FirestoreUser;

  bool get isCustomer => roles.contains(UserRole.customer);
  bool get isAdmin => roles.contains(UserRole.admin);

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
}
