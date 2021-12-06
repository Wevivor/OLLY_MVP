import 'package:flutter/material.dart';
import 'package:simple_tags/simple_tags.dart';
import 'package:sorty/utils/custom_color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> content = [
    '강아지',
    '고양이',
    '독수리',
    '눈사람',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: CustomColor.APPBAR_COLOR,
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black, ),
        ),
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: double.infinity,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: '검색어를 입력해주세요',
              hintStyle: const TextStyle(
                fontSize: 12, color: Colors.grey
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.transparent)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)
              ),
              filled: true,
              fillColor: CustomColor.SEARCH_FIELD_COLOR
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
              padding: const EdgeInsets.only(right: 12),
              icon: Image.asset('assets/icon/icon_search.png', width: 24, height: 24,))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Recents'),
          const SizedBox(height: 20,),
          SimpleTags(content: content,
          tagTextStyle: const TextStyle(
            fontSize: 12
          ),
          wrapSpacing: 8,
          wrapRunSpacing: 10,
          tagContainerPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            tagContainerDecoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20)
            ),
          )
        ],
      ),
    );
  }

}
