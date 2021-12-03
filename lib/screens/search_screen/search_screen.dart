import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  indicator:
                      DotIndicator(distanceFromCenter: 16, color: Colors.black),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  tabs: const [
                    Tab(
                      text: '콘텐츠',
                    ),
                    Tab(text: '보드'),
                    Tab(
                      text: '계정',
                    )
                  ],
                ),
                const Flexible(
                    child: SizedBox(
                  height: 20,
                )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildBoardList(),
                      _buildBoardList(),
                      _buildBoardList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buildFloatingSearchBar(context),
        ],
      )),
    );
  }

  ListView _buildBoardList() {
    return ListView.separated(
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black54),
                          ),
                          title: Text('감자전 만드는 법', style: TextStyle(
                            color: Colors.black, fontSize: 14
                          ),),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    );
  }

  SizedBox _buildChips(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(24)),
                height: 20,
                child: const Center(child: Text('123')),
              )),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[500],
      centerTitle: true,
      title: const Text(
        '검색어를 입력해주세요',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
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

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Align(
      alignment: Alignment.topCenter,
      child: FloatingSearchBar(
        hint: '검색어를 입력해주세요...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          // Call your model, bloc, controller here.
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(height: 112, color: color);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
