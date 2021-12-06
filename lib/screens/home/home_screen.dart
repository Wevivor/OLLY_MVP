import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sorty/components/items/contents_item.dart';
import 'package:sorty/components/textfields/modal_text_field.dart';
import 'package:sorty/providers/main_provider.dart';
import 'package:sorty/screens/my_page/my_page_screen.dart';
import 'package:sorty/screens/profile/profile_screen.dart';
import 'package:sorty/screens/search_screen/search_screen.dart';
import 'package:sorty/screens/settings/settings_screen.dart';
import 'package:sorty/utils/custom_category.dart';
import 'package:sorty/utils/custom_color.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late DateRangePickerController _controller;
  DateTime _date = DateTime.now();
  String _viewType = 'grid';

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final MainProvider mp = Provider.of<MainProvider>(context, listen: false);
    });
    _controller = DateRangePickerController();
    if (_controller.displayDate != null) {
      _date = _controller.displayDate!;
    }
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MainProvider mp = Provider.of<MainProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: _buildFloatingActionButton(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          //all Items
          _buildAllCategoryPage(mp),
          //site Categorized Items
          _buildSiteCategoryPage(),
          //date Categorized Items
          _buildDateCategoryPage(context),
          //Favorite Items
          _buildFavoritePage(mp),
        ],
      ),
    );
  }

  //Building FloatingActionButton

  Container _buildFloatingActionButton(BuildContext context) {
    return Container(
        width: 140,
        margin: const EdgeInsets.only(bottom: 20),
        height: 41,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(153, 153, 153, 0.4), blurRadius: 4)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatMenuButton(
              onPressed: () => Navigator.pushNamed(context, SearchScreen.id),
              icon: 'assets/icon/icon_search.png',
            ),
            FloatMenuButton(
              onPressed: () => _showAddLinkBottomSheet(context),
              icon: 'assets/icon/icon_weblink.png',
            ),
            FloatMenuButton(
              onPressed: () => Navigator.pushNamed(context, ProfileScreen.id),
              icon: 'assets/icon/icon_person.png',
              text: '',
            ),
          ],
        ),
      );
  }

  //Showing Bottom Sheet After Add Link Button Pressed

  Future<dynamic> _showAddLinkBottomSheet(BuildContext context) {
    return showMaterialModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                builder: (context) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 52,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(onTap: (){}, child: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black,)),
                          const Text('웹링크 추가하기', style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold
                          ),),
                          GestureDetector(onTap: (){}, child: const Text('완료')),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('웹링크', style: TextStyle(
                          fontSize: 12
                        ),),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                          child: const ModalTextField())
                    ],
                  ),
            ));
  }

  //Building AppBar

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.APPBAR_COLOR,
      elevation: 0,
        systemOverlayStyle:const  SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TabBar(
                    onTap: (_) {
                      setState(() {});
                    },
                    controller: _tabController,
                    indicator: DotIndicator(
                        distanceFromCenter: 16,
                        color: CustomColor.PRIMARY_COLOR),
                    isScrollable: true,
                    unselectedLabelColor: CustomColor.UNSELECTED_LABEL_COLOR,
                    labelColor: CustomColor.PRIMARY_COLOR,
                    labelStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    tabs: const [
                      Tab(
                        text: '전체',
                      ),
                      Tab(text: '사이트별'),
                      Tab(text: '날짜별'),
                      Tab(text: 'Favorite'),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: _buildViewTypeButton(context))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewTypeButton(BuildContext context) {
    if (_tabController.index == 0 && _viewType == 'grid') {
      return GestureDetector(
          onTap: () => setState(() => _viewType = 'list'),
          child: Image.asset(
            'assets/icon/icon_grid.png',
            width: 24,
            height: 24,
          ));
    } else if (_tabController.index == 0 && _viewType == 'list') {
      return GestureDetector(
          onTap: () => setState(() => _viewType = 'grid'),
          child: Image.asset(
            'assets/icon/icon_list.png',
            width: 24,
            height: 24,
          ));
    }
    return Container();
  }

  //Building Grid All Categorized Page

  GridView _buildAllCategoryPage(MainProvider mp) {
    return GridView.builder(
      controller: mp.homeScreenController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 0.8),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 32, top: 20),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ContentsItem();
      },
    );
  }

  //Building Site Categorized Page

  GridView _buildSiteCategoryPage() {
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 14,
            childAspectRatio: 1 / 0.5),
        itemCount: 8,
        itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: CustomColor.SITE_COLOR_LIST[index],
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CustomCategory.SITE_CATEGORY_LIST[index],
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    '28개',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ));
  }

  //Building Date Categorized Page

  SingleChildScrollView _buildDateCategoryPage(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          _buildCustomDatePickerHeader(),
          _buildDatePicker(context),
          _buildContentsListHeader(),
          _buildContentsItems()
        ],
      ),
    );
  }

  Row _buildCustomDatePickerHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            DateFormat('yyyy년 MM월').format(_date),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(child: Container()),
        SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
              color: Colors.white,
              iconSize: 20,
              onPressed: () {
                setState(() {
                  _controller.backward!();
                });
              },
            )),
        SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black,
              ),
              color: Colors.white,
              highlightColor: Colors.lightGreen,
              onPressed: () {
                setState(() {
                  _controller.forward!();
                });
              },
            )),
        Container(
          width: 20,
        )
      ],
    );
  }

  Container _buildDatePicker(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.4,
      child: SfDateRangePicker(
        controller: _controller,
        view: DateRangePickerView.month,
        monthViewSettings: const DateRangePickerMonthViewSettings(
            showTrailingAndLeadingDates: false),
        headerHeight: 0,
        headerStyle: const DateRangePickerHeaderStyle(
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        initialSelectedDate: DateTime.now(),
        selectionMode: DateRangePickerSelectionMode.single,
        showNavigationArrow: true,
      ),
    );
  }

  Container _buildContentsListHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '10월 8일의 컨텐츠',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '12개 더보기 >',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  GridView _buildContentsItems() {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ContentsItem();
        });
  }

  // Build Favorite Page

  GridView _buildFavoritePage(MainProvider mp) {
    return GridView.builder(
      controller: mp.homeScreenController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 0.8),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 32, top: 20),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ContentsItem();
      },
    );
  }
}
