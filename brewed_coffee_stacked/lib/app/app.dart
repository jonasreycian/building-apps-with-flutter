import 'package:brewed_coffee_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:brewed_coffee_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:brewed_coffee_stacked/ui/views/home/home_view.dart';
import 'package:brewed_coffee_stacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:brewed_coffee_stacked/services/analytics_service.dart';
import 'package:brewed_coffee_stacked/services/auth_service.dart';
import 'package:brewed_coffee_stacked/services/firestore_service.dart';
import 'package:brewed_coffee_stacked/services/in_app_messaging_service.dart';
import 'package:brewed_coffee_stacked/services/messaging_service.dart';
import 'package:brewed_coffee_stacked/ui/dialogs/alert/alert_dialog.dart';
import 'package:brewed_coffee_stacked/ui/views/cart/cart_view.dart';
import 'package:brewed_coffee_stacked/ui/views/forgot_password/forgot_password_view.dart';
import 'package:brewed_coffee_stacked/ui/views/login_email/login_email_view.dart';
import 'package:brewed_coffee_stacked/ui/views/login/login_view.dart';
import 'package:brewed_coffee_stacked/ui/views/menu/menu_view.dart';
import 'package:brewed_coffee_stacked/ui/views/register/register_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: LoginEmailView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MenuView),
    MaterialRoute(page: RegisterView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AnalyticsService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: InAppMessagingService),
    LazySingleton(classType: MessagingService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: AlertDialog),
// @stacked-dialog
  ],
)
class App {}
