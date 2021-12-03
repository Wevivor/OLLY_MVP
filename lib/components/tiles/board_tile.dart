
import 'package:flutter/material.dart';
import 'package:sorty/screens/weblink/weblink_screen.dart';

class BoardTile extends StatelessWidget {
  const BoardTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, WebLinkScreen.id),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      title: const Text(
        '베이킹 레시피 자료',
        style: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text(
          '7 items, 4 members',
          style: TextStyle(color: Colors.grey[500], fontSize: 12),
        ),
      ),
    );
  }
}
