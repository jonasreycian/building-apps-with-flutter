import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:brewedcoffee/app/constants.dart';
import 'package:brewedcoffee/app/models/models.dart';
import 'package:brewedcoffee/app/screens/menu_detail.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  CoffeeItem({
    required this.animation,
    required this.coffee,
    super.key,
  });

  final FirestoreService _firestoreService = FirestoreService.instance;

  final Coffee coffee;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Coffee>(
      stream: _firestoreService.getCoffee(coffee.id),
      builder: (context, AsyncSnapshot<Coffee> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return const SizedBox();
        }

        Coffee? newCoffee = coffee;

        if (snapshot.hasData) {
          newCoffee = snapshot.data;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.bounceIn,
              reverseCurve: Curves.bounceOut,
            ),
          ),
          child: GestureDetector(
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: Text(
                newCoffee!.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                newCoffee.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              leading: Icon(
                newCoffee.iconData,
                size: 40,
                color: brown,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            onTap: () {
              CoffeeRouter.instance.push(
                MenuDetails.route(
                  id: coffee.id,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
