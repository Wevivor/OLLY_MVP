import 'package:flutter/material.dart';
import 'package:sorty/components/buttons/navigation_button.dart';
import 'package:sorty/screens/board_list/board_list_screen.dart';
import 'package:sorty/utils/custom_color.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);
  static const String id = '/profile';

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen>
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
      child: Container(
        color: Colors.white,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [_buildSliverAppBar(context)];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildGridView(),
              _buildGridView(),
              _buildGridView(),
              _buildGridView(),
              _buildGridView(),
            ],
          ),

        ),
      ),
    );
  }

  GridView _buildGridView() {
    return GridView(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1 / 1.2,
          crossAxisCount: 2),
      children: List.generate(10, (index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, BoardListScreen.id),
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8)),
            child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text('콘텐츠',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
          ),
        );
      }),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      elevation: 0,
      backgroundColor: Colors.white,
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      leading: IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          radius: 15,
        ),
      ),
      title: const Text(
        '마이페이지',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icon/icon_search.png',
            width: 24,
            height: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icon/icon_setting.png',
            width: 24,
            height: 24,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.black54,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                '김코코',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: ColoredBox(
         color: Colors.white,
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            unselectedLabelColor: CustomColor.UNSELECTED_LABEL_COLOR,
            labelColor: CustomColor.PRIMARY_COLOR,
            indicator: DotIndicator(
                radius: 3, color: CustomColor.PRIMARY_COLOR, distanceFromCenter: 16),
            tabs: const [
              Tab(text: '전체',),
              Tab(text: '일/공부'),
              Tab(text: '자기계발'),
              Tab(text: '쇼핑몰'),
              Tab(text: '힐링'),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatMenuButton extends StatelessWidget {
  const FloatMenuButton({
    Key? key, required this.icon, required this.onPressed, this.text =  '',
  }) : super(key: key);
  final String icon;
  final VoidCallback onPressed;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, width: 20, height: 20,),
            const SizedBox(height: 4,),
            text!=''?Text(text, style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700
            ),):Container()
          ],
        ),
      ),
    );
  }
}
