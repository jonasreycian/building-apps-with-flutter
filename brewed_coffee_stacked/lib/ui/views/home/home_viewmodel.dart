import 'package:brewed_coffee_stacked/app/app.bottomsheets.dart';
import 'package:brewed_coffee_stacked/app/app.dialogs.dart';
import 'package:brewed_coffee_stacked/app/app.locator.dart';
import 'package:brewed_coffee_stacked/app/app.router.dart';
import 'package:brewed_coffee_stacked/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final NavigationService navigationService = locator<NavigationService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void navigateToRegisterScreen() {
    navigationService.replaceWithRegisterView();
  }

  void navigateToLoginScreen() {
    navigationService.replaceWithLoginView();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
