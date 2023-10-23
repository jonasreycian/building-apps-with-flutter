import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../constants.dart';
import '../../../enums/enums.dart';
import '../../../models/models.dart';
import '../../../services/auth_service.dart';
import '../../../services/firestore_service.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));

    // This is where you can make decisions on where your app should navigate when
    if (_authService.currentUser != null) {
      final String userId = _authService.currentUser!.uid;

      _firestoreService
        ..setUserLastLoginTimestamp(userId)
        ..addLog(
          activity: ActivityEnum.login,
          userId: userId,
        );

      _initializeCoffeeCollection();

      _navigationService.replaceWithMenuView();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }

  void _initializeCoffeeCollection() async {
    final Stream<List<Coffee>> coffeesStream = _firestoreService.getCoffees();

    final List<Coffee> coffeeList = await coffeesStream.first;

    if (coffeeList.isEmpty || coffeeList.length != coffees.length) {
      for (var coffee in coffees) {
        _firestoreService.addCoffee(coffee);
      }
    }
  }
}
