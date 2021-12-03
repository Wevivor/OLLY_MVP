import 'package:flutter/material.dart';

//사진 수정 페이지

class PhotoUpdateScreen extends StatelessWidget {
  const PhotoUpdateScreen({Key? key}) : super(key: key);
  static const String id = 'photo/update';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                color: Colors.black54,
              ),
              const SizedBox(height: 20,),
              const Text('제목', style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 12,),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              const SizedBox(height: 20,),
              const Text('코멘트', style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 12,),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12)
                ),
              )

            ],
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
      title: const Text('사진수정', style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),),
      leading: IconButton(
        onPressed: (){},
        icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black,)
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Container(
            width: 20,
            height: 20,
            color: Colors.black54,
          )
        )
      ],
    );
  }
}
