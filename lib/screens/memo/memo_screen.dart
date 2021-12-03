import 'package:flutter/material.dart';

class MemoScreen extends StatelessWidget {
  const MemoScreen({Key? key}) : super(key: key);
  static const String id = '/memo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  //앱바

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[500],
      elevation: 0,
      centerTitle: true,
      title: const Text('베이킹', style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),),
    );
  }
}
