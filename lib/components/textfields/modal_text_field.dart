import 'package:flutter/material.dart';

class ModalTextField extends StatelessWidget {
  const ModalTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}