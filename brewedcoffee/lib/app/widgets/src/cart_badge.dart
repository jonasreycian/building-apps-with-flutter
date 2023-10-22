import 'package:brewedcoffee/app/models/models.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:flutter/material.dart';

class CartBadge extends StatelessWidget {
  CartBadge({
    required this.child,
    required this.top,
    required this.right,
    super.key,
    this.color,
  });

  final FirestoreService _firestoreService = FirestoreService.instance;
  final AuthService _authService = AuthService.instance;

  final double top;
  final double right;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartItem>?>(
      stream: _firestoreService.getUserCart(_authService.currentUser!.uid),
      builder: (context, AsyncSnapshot<List<CartItem>?> snapshot) {
        var cartItems = 0;

        if (snapshot.hasError) {
          print(snapshot.error);
          print('Error!');
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            cartItems = snapshot.data!.length;
            return Stack(
              alignment: Alignment.center,
              children: [
                child,
                Positioned(
                  right: right,
                  top: top,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: color ?? Colors.red,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      cartItems.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
