import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/models/models.dart';
import 'package:brewedcoffee/app/screens/menu.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:brewedcoffee/app/services/src/in_app_messaging.dart';
import 'package:brewedcoffee/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  static String routeName = 'Shops';

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final FirestoreService _firestoreService = FirestoreService.instance;
  final AuthService _authService = AuthService.instance;
  final AnalyticsService _analyticsService = AnalyticsService.instance;
  final InAppMessagingService _fipm = InAppMessagingService.instance;

  @override
  Widget build(BuildContext context) {
    final userId = _authService.currentUser!.uid;

    return StreamBuilder<List<CartItem>>(
      stream: _firestoreService.getUserCart(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final items = snapshot.data ?? [];

        if (snapshot.hasError || !snapshot.hasData || items.isEmpty) {
          return const NoItems();
        }

        final cartTotal = items
            .map((item) => item.total)
            .reduce((value, element) => value + element);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  initialItemCount: items.length,
                  itemBuilder: (
                    context,
                    index,
                    Animation<double> animation,
                  ) {
                    final item = items[index];

                    return Dismissible(
                      key: Key(item.id ?? '$index'),
                      background: Container(color: Colors.red[700]),
                      onDismissed: (direction) {
                        if (items.length == 1) {
                          _fipm.triggerEvent('remove_and_empty_basket');
                        }
                        // _analyticsService.logRemoveItem(
                        //   itemId: item.coffee.id,
                        //   itemName: item.coffee.name,
                        // );
                        _firestoreService.deleteUserCartItem(
                          userId: userId,
                          cartId: item.id!,
                        );
                        listKey.currentState!.removeItem(
                          index,
                          (context, animation) => const SizedBox(),
                        );
                      },
                      direction: DismissDirection.endToStart,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(8),
                          ),
                        ),
                        onPressed: () {},
                        child: ListTile(
                          title: Text(item.coffee.name),
                          leading: Text('${item.quantity}  x'),
                          trailing: Text('\$${item.total}'),
                          subtitle: CoffeeCartExtraInfo(item: item),
                        ),
                      ),
                    );
                  },
                ),
              ),
              TotalAmount(cartTotal: cartTotal),
              const SizedBox(height: 20),
              CommonButton(
                text: 'Send Order',
                highlighColor: true,
                onPressed: () async {
                  final orderId =
                      await _firestoreService.submitOrder(userId, items);

                  await _analyticsService.logPlaceOrder(
                    orderId: orderId,
                    coffees: items.map((item) => item.id).toList(),
                    total: cartTotal,
                    quantity: items.length,
                  );

                  await CoffeeRouter.instance.pushReplacement(
                    MenuScreen.route(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
