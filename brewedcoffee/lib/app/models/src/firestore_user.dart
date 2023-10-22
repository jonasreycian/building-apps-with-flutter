import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
class FirestoreUser with _$FirestoreUser {
  const factory FirestoreUser({required List<UserRoleEnum> roles}) =
      _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
  const FirestoreUser._();

  bool get isCustomer => roles.contains(UserRoleEnum.customer);
  bool get isAdmin => roles.contains(UserRoleEnum.admin);
}
