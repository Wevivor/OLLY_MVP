import 'package:flutter/material.dart';
import 'package:sorty/utils/custom_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.BACKGROUND_COLOR,
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildProfileTile(),
          Divider(height: 1, color: CustomColor.DIVIDER_COLOR,),
          const SizedBox(height: 32,),
          _buildProfileMenu(),
          const SizedBox(height: 40,),
          _buildLogoutButton(),
          const SizedBox(height: 20,),
          _buildVersionInfo()
        ],
      ),
    );
  }


  //Building  AppBar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.APPBAR_COLOR,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios, size: 24, color: Colors.black,),
      ),
      elevation: 0,
      centerTitle: true,
      title: const Text('Account', style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),),
    );
  }


  //Building Profile Tile
  ListTile _buildProfileTile() {
    return ListTile(
      onTap: (){},
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      leading: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
          radius: 25,
        ),
      ),
      title: const Text('김수민', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),),
      subtitle: const Text('Wevivors@gmail.com', style: TextStyle(
          fontSize: 12
      ),),
      trailing: IconButton(
        onPressed: (){},
        icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black,),
      ),
    );
  }


  //Building Profile Menu
  Container _buildProfileMenu() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.2, color: CustomColor.DIVIDER_COLOR)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24) ,
            child: const Text('공지사항', textAlign: TextAlign.start, style: TextStyle(
                fontSize: 12
            ),),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24) ,
            child: const Text('설정', textAlign: TextAlign.start, style: TextStyle(
                fontSize: 12
            ),),
          ),
          const Divider(height: 1,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24) ,
            child: const Text('듀토리얼', textAlign: TextAlign.start, style: TextStyle(
                fontSize: 12
            ),),
          ),
          const Divider(height: 1,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24) ,
            child: const Text('문의하기 / 도움말', textAlign: TextAlign.start, style: TextStyle(
                fontSize: 12
            ),),
          ),
        ],
      ),
    );
  }

  // Building Logout Button
  Align _buildLogoutButton() {
    return const Align(
        alignment: Alignment.center,
        child: Text('로그아웃', style: TextStyle(
            fontSize: 12,
            decoration: TextDecoration.underline
        ),));
  }

  // Building Version Info
  Align _buildVersionInfo() {
    return const Align(
        child: Text('version 0.0.1', style: TextStyle(
            fontSize: 12
        ),));
  }



}
