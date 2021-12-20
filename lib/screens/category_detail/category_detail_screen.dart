import 'package:flutter/material.dart';
import 'package:sorty/components/items/contents_item.dart';
import 'package:sorty/components/tiles/contents_tile.dart';
import 'package:sorty/screens/weblink/weblink_screen.dart';
import 'package:sorty/utils/custom_color.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({Key? key}) : super(key: key);
  static const String id = '/category/id';

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.BACKGROUND_COLOR,
      appBar: _buildAppBar(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [_buildGridView(), _buildListview()],
      ),
    );
  }

  //Build Items with ListView

  GridView _buildListview() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 1 / 0.4, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return ContentsTile(
          onTap: (){
            Navigator.pushNamed(context, WebLinkScreen.id);
          },
        );
      },
    );
  }

  //Build Items with GridView

  GridView _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) => ContentsItem(
        onTap: () {
          Navigator.pushNamed(context, WebLinkScreen.id);
        },
      ),
      itemCount: 4,
    );
  }

  //Build AppBar

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: CustomColor.APPBAR_COLOR,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.black,
        ),
      ),
      title: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              filled: true,
              fillColor: CustomColor.HINT_COLOR,
              hintText: 'Instagram 에서 모은 링크에서 찾기',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent))),
        ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  if (_currentIndex == 0) {
                    setState(() {
                      _currentIndex = 1;
                      _pageController.jumpToPage(_currentIndex);
                    });
                  } else {
                    _currentIndex = 0;
                    _pageController.jumpToPage(_currentIndex);
                  }
                },
                icon: Image.asset(
                  _currentIndex == 0
                      ? 'assets/icon/icon_grid.png'
                      : 'assets/icon/icon_list.png',
                  width: 20,
                  height: 20,
                )))
      ],
    );
  }
}


