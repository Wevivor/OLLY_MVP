
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sorty/components/tiles/board_tile.dart';
import 'package:sorty/screens/weblink/weblink_screen.dart';

class BoardListScreen extends StatefulWidget {
  const BoardListScreen({Key? key}) : super(key: key);
  static const String id = '/boards';

  @override
  State<BoardListScreen> createState() => _BoardListScreenState();
}

class _BoardListScreenState extends State<BoardListScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentPage, keepPage: false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Column(
            children: [
              _buildTabBar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: PageView(
                  controller: _pageController,
                  children: [
                    StaggeredGridView.countBuilder(
                      padding: const EdgeInsets.all(12),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) =>
                          const BoardGridItem(),
                      staggeredTileBuilder: (int index) => StaggeredTile.count(
                          _handleCrossAxisCount(index),
                          _handleMainAxisCount(index)),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    _buildListView()
                  ],
                ),
              ),
            ],
          )),
    );
  }

  //인덱스에 따른 타일 크기 조정

  int _handleCrossAxisCount(int index) {
    switch (index % 3) {
      case 0:
        return 2;
      case 1:
        return 2;
      case 2:
        return 4;
      default:
        return 2;
    }
  }

  double _handleMainAxisCount(int index) {
    switch (index % 3) {
      case 0:
        return 2;
      case 1:
        return 2;
      case 2:
        return 1.5;
      default:
        return 2;
    }
  }

  //리스트 뷰 생성

  ListView _buildListView() {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 6,
        separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey[300],
            ),
        itemBuilder: (context, index) {
          return const BoardTile();
        });
  }

  //탭바

  SizedBox _buildTabBar() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                _pageController.jumpToPage(0);
                setState(() {
                  _currentPage = 0;
                });
              },
              icon: Image(
                image: AssetImage(_currentPage == 0
                    ? 'assets/icon/grid_active.png'
                    : 'assets/icon/grid_inactive.png'),
                width: 24,
                height: 24,
              )),
          IconButton(
              onPressed: () {
                _pageController.jumpToPage(1);
                setState(() {
                  _currentPage = 1;
                });
              },
              icon: Image(
                image: AssetImage(_currentPage == 1
                    ? 'assets/icon/list_active.png'
                    : 'assets/icon/list_inactive.png'),
                width: 24,
                height: 24,
              )),
        ],
      ),
    );
  }

  //앱바

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[500],
      elevation: 0,
      centerTitle: true,
      title: const Text(
        '베이킹',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              size: 24,
              color: Colors.black,
            ))
      ],
    );
  }
}

class BoardGridItem extends StatelessWidget {
  const BoardGridItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, WebLinkScreen.id),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[500], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                )
              ],
            ),
            Container(
              width: 150,
              height: 20,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}

//보드리스트 아이템 컴포넌트
