import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../services/auth_service.dart';
import '../../services/firestore_service.dart';

class CartBadgeModel extends StreamViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();

  @override
  Stream get stream {
    return _firestoreService.getUserCart(_authService.currentUser!.uid);
  }
}
