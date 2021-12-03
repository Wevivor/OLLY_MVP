import 'package:flutter/material.dart';

class PushAlarmScreen extends StatelessWidget {
  const PushAlarmScreen({Key? key}) : super(key: key);
  static const String id = 'alarm/push';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildPushList()
    );
  }

  //푸시 알림 리스트 생성

  ListView _buildPushList() {
    return ListView.separated(itemBuilder: (context, index){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4)
              ),
            ),
            const SizedBox(width: 20,),
            Flexible(
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4)
                ),
              ),
            )
          ],
        )
      );
    }, separatorBuilder: (context, index){
      return const Divider();
    }, itemCount: 7);
  }

  //앱바 
  
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[500],
      centerTitle: true,
      elevation: 0,
      title: const Text('받은 알림', style: TextStyle(
        color: Colors.black,
      ),),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios, size: 24, color: Colors.black,),
      ),
    );
  }
}
