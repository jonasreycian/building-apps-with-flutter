import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:brewed_coffee_stacked/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:brewed_coffee_stacked/services/analytics_service.dart';
import 'package:brewed_coffee_stacked/services/auth_service.dart';
import 'package:brewed_coffee_stacked/services/firestore_service.dart';
import 'package:brewed_coffee_stacked/services/in_app_messaging_service.dart';
import 'package:brewed_coffee_stacked/services/messaging_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AnalyticsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FirestoreService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<InAppMessagingService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MessagingService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAnalyticsService();
  getAndRegisterAuthService();
  getAndRegisterFirestoreService();
  getAndRegisterInAppMessagingService();
  getAndRegisterMessagingService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAnalyticsService getAndRegisterAnalyticsService() {
  _removeRegistrationIfExists<AnalyticsService>();
  final service = MockAnalyticsService();
  locator.registerSingleton<AnalyticsService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockFirestoreService getAndRegisterFirestoreService() {
  _removeRegistrationIfExists<FirestoreService>();
  final service = MockFirestoreService();
  locator.registerSingleton<FirestoreService>(service);
  return service;
}

MockInAppMessagingService getAndRegisterInAppMessagingService() {
  _removeRegistrationIfExists<InAppMessagingService>();
  final service = MockInAppMessagingService();
  locator.registerSingleton<InAppMessagingService>(service);
  return service;
}

MockMessagingService getAndRegisterMessagingService() {
  _removeRegistrationIfExists<MessagingService>();
  final service = MockMessagingService();
  locator.registerSingleton<MessagingService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
