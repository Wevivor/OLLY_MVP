
import 'package:flutter/material.dart';
import 'package:sorty/screens/remind_alarm/remind_alarm_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String id = '/settings';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          centerTitle: true,
          elevation: 0,
          title: const Text(
            '설정',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: ()  => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        body: _buildMenuList(context),
      ),
    );
  }

  //메뉴리스트 생성

  Container _buildMenuList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height - 60,
      child: Column(
        children: [
          const ListTile(
            title: Text('듀토리얼'),
          ),
          const Divider(),
          const ListTile(
            title: Text('공지사항'),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, RemindAlarmScreen.id),
            title: const Text('리마인드 알림'),
          ),
          const Divider( thickness: 1,),
          const ListTile(
            title: Text('문의하기/도움말'),
          ),
          const Divider(),
          Flexible(child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const Text('로그아웃', style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: Colors.grey
                  ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('version 0.0.1', style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12
                ),)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
