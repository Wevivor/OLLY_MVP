
import 'package:flutter/material.dart';
import 'package:sorty/screens/my_page/my_page_screen.dart';
import 'package:sorty/screens/search_screen/search_screen.dart';

class MyBoardScreen extends StatefulWidget {
  const MyBoardScreen({Key? key}) : super(key: key);
  static const String id = '/my_board';

  @override
  State<MyBoardScreen> createState() => _MyBoardScreenState();
}

class _MyBoardScreenState extends State<MyBoardScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                labelStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                indicatorPadding: EdgeInsets.zero,
                isScrollable: true,
                tabs: const <Widget>[
                  Tab(
                    text: "전체",
                  ),
                  Tab(
                    text: "일/공부",
                  ),
                  Tab(
                    text: "자기계발",
                  ),
                  Tab(
                    text: "쇼핑몰",
                  ),
                  Tab(
                    text: "힐링",
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildBoardItem(),
                    _buildBoardItem(),
                    _buildBoardItem(),
                    _buildBoardItem(),
                    _buildBoardItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //보드 아이템 리스트
  Container _buildBoardItem() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1 / 1.2),
          itemCount: 6,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[500],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      '그림',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              )),
    );
  }

  //앱바 위젯
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      title: const Text(
        '내 보드',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () => Navigator.pushNamed(context, SearchScreen.id),
            icon: const Icon(
              Icons.search,
              size: 24,
              color: Colors.black,
            )),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, MyPageScreen.id),
          icon: const Icon(
            Icons.person,
            size: 24,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
