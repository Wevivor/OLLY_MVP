import 'package:flutter/material.dart';

class ModalTopBar extends StatelessWidget {
  const ModalTopBar({
    Key? key,
    required this.backButtonPressed,
    required this.completeButtonPressed,
    required this.title,
  }) : super(key: key);
  final VoidCallback backButtonPressed;
  final VoidCallback completeButtonPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: backButtonPressed,
          child: const SizedBox(
              width: 32,
              height: 32,
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.black,
              )),
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
        GestureDetector(
          onTap: completeButtonPressed,
          child: const SizedBox(
            width: 32,
            height: 32,
            child: Center(
              child: Text(
                '완료',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
