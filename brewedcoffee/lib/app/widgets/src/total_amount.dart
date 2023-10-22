import 'package:brewedcoffee/app/constants.dart';
import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    required this.cartTotal,
    super.key,
  });

  final num cartTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: brown),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'total:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '\$$cartTotal',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
