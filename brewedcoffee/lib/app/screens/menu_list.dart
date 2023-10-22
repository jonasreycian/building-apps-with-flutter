import 'package:brewedcoffee/app/models/models.dart';
import 'package:brewedcoffee/app/screens/coffee_item.dart';
import 'package:brewedcoffee/app/services/services.dart';
import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  static String routeName = 'MenuList';

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final FirestoreService _firestoreService = FirestoreService.instance;
  final List<Coffee> _items = [];

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: _items.length,
      itemBuilder: (context, index, Animation<double> animation) {
        return CoffeeItem(
          coffee: _items[index],
          animation: animation,
        );
      },
    );
  }

  Future<void> _loadItems() async {
    final coffees = await _firestoreService.getCoffees().first;

    for (final item in coffees) {
      await Future.delayed(const Duration(milliseconds: 80));
      _items.add(item);
      if (listKey.currentState != null) {
        listKey.currentState!.insertItem(_items.length - 1);
      }
    }
  }
}
