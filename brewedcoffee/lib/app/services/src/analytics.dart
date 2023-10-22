import 'package:brewedcoffee/app/enums/enums.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class AnalyticsService {
  // Singleton setup: prevents multiple instances of this class.
  factory AnalyticsService() => _service;
  AnalyticsService._();
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  static final AnalyticsService _service = AnalyticsService._();

  static AnalyticsService get instance => _service;

  static FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _service._analytics);

  Future<void> logLogin({
    String loginMethod = 'email',
  }) async {
    return _analytics.logLogin(loginMethod: loginMethod);
  }

  Future<void> logAddToCart({
    required String itemId,
    required String itemName,
    required String itemCategory,
    required int quantity,
  }) async {
    return _analytics.logAddToCart(
      items: [
        AnalyticsEventItem(
          itemId: itemId,
          itemName: itemName,
          itemCategory: itemCategory,
          quantity: quantity,
        ),
      ],
    );
  }

  Future<void> logPlaceOrder({
    required String orderId,
    required num total,
    required List<String?> coffees,
    required int quantity,
  }) async {
    return _analytics.logEvent(
      name: 'place_order',
      parameters: {
        'quantity': quantity,
        'total': total,
        'coffees': coffees.toString(),
        'orderId': orderId,
      },
    );
  }

  Future<void> setUserProperties({
    required String userId,
    required List<UserRoleEnum> userRoles,
  }) async {
    await _analytics.setUserId(id: userId);
    await _analytics.setUserProperty(
      name: 'user_role', // custom userProperty
      value: userRoles.where((UserRoleEnum role) => role.isCustomer).isNotEmpty
          ? 'customer'
          : 'adminOrUnknown',
    );
  }

  Future<void> logLogoutPressed({
    bool isBasketEmpty = true,
  }) async {
    if (kDebugMode) {
      print('logout_pressed');
    }

    return _analytics.logEvent(
      name: 'logout_pressed',
      parameters: {'is_basket_empty': isBasketEmpty},
    );
  }

  Future<void> logRemoveItem({
    required String itemId,
    required String itemName,
  }) async {
    return _analytics.logEvent(
      name: 'remove_and_empty_basket',
      parameters: {
        'itemId': itemId,
        'itemName': itemName,
      },
    );
  }
}
