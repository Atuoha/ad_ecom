import 'package:flutter/material.dart';

import '../constants/color.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  CustomContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: yellowLight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text),
      ),
    );
  }
}
