import 'package:flutter/material.dart';
import 'package:sorty/utils/custom_color.dart';

class TutorialButton extends StatelessWidget {
  const TutorialButton({
    Key? key,
    required this.context, required this.onPressed, required this.buttonText,
  }) : super(key: key);

  final BuildContext context;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: CustomColor.PRIMARY_COLOR,
      minWidth: MediaQuery.of(context).size.width * 0.4,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
      child: const Text(
        '완료',
        style:
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}