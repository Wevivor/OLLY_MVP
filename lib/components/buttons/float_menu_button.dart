import 'package:flutter/material.dart';

class FloatMenuButton extends StatelessWidget {
  const FloatMenuButton({
    Key? key, required this.icon, required this.onPressed, this.text =  '',
  }) : super(key: key);
  final String icon;
  final VoidCallback onPressed;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, width: 20, height: 20,),
            const SizedBox(height: 4,),
            text!=''?Text(text, style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700
            ),):Container()
          ],
        ),
      ),
    );
  }
}
