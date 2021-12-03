import 'package:flutter/material.dart';
import 'package:sorty/utils/custom_color.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.activeIcon,
    this.isActive = false,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String icon;
  final String activeIcon;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 100,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isActive ? activeIcon : icon,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: TextStyle(
                  color: isActive ? CustomColor.PRIMARY_COLOR : CustomColor.INACTIVE_COLOR,
                  fontSize: 9,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
