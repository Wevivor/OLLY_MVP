import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sorty/providers/main_provider.dart';
import 'package:sorty/screens/search_screen/search_screen.dart';
import 'package:sorty/screens/settings/settings_screen.dart';
import 'package:sorty/utils/custom_color.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final MainProvider mp = Provider.of<MainProvider>(context, listen: false);
    });

    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MainProvider mp = Provider.of<MainProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildBoard(mp),
            _buildBoard(mp),
            _buildBoard(mp),
            _buildBoard(mp),
            _buildBoard(mp),
          ],
        ),
      ),
    );
  }

  //앱바

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.APPBAR_COLOR,
      elevation: 0,
      title: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 500),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/icon_search.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                  child: SizedBox(
                      height: double.infinity,
                      child: TextField(
                        style: const TextStyle(fontSize: 12),
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        cursorColor: CustomColor.CURSOR_COLOR,
                        cursorHeight: 12,
                      ))),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => Navigator.pushNamed(context, SearchScreen.id),
            icon: Image.asset(
              'assets/icon/icon_alarm.png',
              width: 24,
              height: 24,
            )),
        IconButton(
            onPressed: () => Navigator.pushNamed(context, SettingsScreen.id),
            icon: Image.asset(
              'assets/icon/icon_filter.png',
              width: 24,
              height: 24,
            ))
      ],
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: ColoredBox(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            indicator: DotIndicator(
                distanceFromCenter: 16, color: CustomColor.PRIMARY_COLOR),
            isScrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            unselectedLabelColor: CustomColor.UNSELECTED_LABEL_COLOR,
            labelColor: CustomColor.PRIMARY_COLOR,
            tabs: const [
              Tab(
                text: '전체',
              ),
              Tab(text: '일/공부'),
              Tab(text: '자기계발'),
              Tab(text: '쇼핑몰'),
              Tab(text: '힐링')
            ],
          ),
        ),
      ),
    );
  }

  //보드 생성

  NotificationListener _buildBoard(MainProvider mp) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification){
        if(scrollNotification is ScrollStartNotification){
          mp.floatingActionButtonIsOpened =false;
        }
        return true;
      },
      child: ListView.separated(
        controller: mp.homeScreenController,
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 32, top: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: CustomColor.ITEM_BORDER_COLOR, width: 1)),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '슬견생',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '댕댕이 좋아하는 사람',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
}
