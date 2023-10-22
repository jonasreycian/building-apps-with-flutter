// ignore: import_of_legacy_library_into_null_safe
import 'package:brewedcoffee/app/screens/cart.dart';
import 'package:brewedcoffee/app/screens/menu_list.dart';
import 'package:brewedcoffee/app/screens/orders.dart';
import 'package:brewedcoffee/app/screens/profile.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  static String routeName = 'menuScreen';
  static Route<MenuScreen> route() {
    return MaterialPageRoute<MenuScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => const MenuScreen(),
    );
  }

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    MenuList(),
    CartScreen(),
    OrdersScreen(),
    const ProfileScreen(),
  ];

  final FirebaseAnalyticsObserver observer = AnalyticsService.observer;
  final AuthService _authService = AuthService.instance;
  final FirestoreService _firestoreService = FirestoreService.instance;
  final MessagingService _messagingService = MessagingService.instance;

  @override
  void initState() {
    super.initState();
    setupMessaging();
  }

  void _sendCurrentTabToAnalytics() {
    final screeName = '${MenuScreen.routeName}/tab$_selectedIndex';
    observer.analytics.setCurrentScreen(
      screenName: screeName,
    );
    print('Logged $screeName');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _sendCurrentTabToAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome to the WiredBrain'),
        centerTitle: false,
        actions: [
          CartBadge(
            top: 8,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
          ),
        ],
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.brown.shade300,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown.shade800,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<void> setupMessaging() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await _messagingService.initialize();
        if (_messagingService.userDeviceToken != null) {
          await _firestoreService.registerUserToken(
            token: _messagingService.userDeviceToken!,
            userId: _authService.currentUser!.uid,
          );
        }
      },
    );
  }
}
