import 'package:flutter/material.dart';

import '../constants/color.dart';

class RowComponent extends StatelessWidget {
  final String title;
  RowComponent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
              'View All',
              style: TextStyle(
                color: yellowDeep,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                color: yellowDeep,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
