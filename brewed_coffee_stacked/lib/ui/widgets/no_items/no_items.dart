import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  const NoItems({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title ?? 'No items',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
