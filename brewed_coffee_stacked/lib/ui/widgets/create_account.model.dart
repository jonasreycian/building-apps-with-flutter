import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class CreateAccountModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToRegisterScreen() {
    _navigationService.navigateToRegisterView();
  }
}
