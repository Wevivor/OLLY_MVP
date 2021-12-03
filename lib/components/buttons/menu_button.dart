import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.menuText,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final String menuText;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black54,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            menuText,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                decoration: TextDecoration.none),
          )
        ],
      ),
    );
  }
}
