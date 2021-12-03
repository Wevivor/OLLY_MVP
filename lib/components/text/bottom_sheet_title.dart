import 'package:flutter/material.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          decoration: TextDecoration.none),
    );
  }
}
