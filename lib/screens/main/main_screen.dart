import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sorty/components/buttons/navigation_button.dart';
import 'package:sorty/components/text/bottom_sheet_title.dart';
import 'package:sorty/providers/main_provider.dart';
import 'package:sorty/screens/home/home_screen.dart';
import 'package:sorty/screens/my_page/my_page_screen.dart';
import 'package:sorty/utils/custom_color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String id = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _activeIndex = 0;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final mp = Provider.of<MainProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MainProvider mp = Provider.of<MainProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.BACKGROUND_COLOR,
        bottomNavigationBar: _buildBottomNavigationBar(mp),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: mp.floatingActionButtonIsOpened
            ? Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.only(bottom: 80),
                height: 74,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(153, 153, 153, 0.4),
                          blurRadius: 4)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatMenuButton(
                      onPressed: () =>
                          _buildNewBoardMenuBottomSheet(context, mp),
                      icon: 'assets/icon/icon_newboard.png',
                      text: '새보드',
                    ),
                    FloatMenuButton(
                      onPressed: () => _buildAddLinkBottomSheet(context, mp),
                      icon: 'assets/icon/icon_weblink.png',
                      text: '웹링크',
                    ),
                    FloatMenuButton(
                      onPressed: () => _buildPhotoMenuBottomSheet(context, mp),
                      icon: 'assets/icon/icon_image.png',
                      text: '사진',
                    ),
                    FloatMenuButton(
                      onPressed: () => _buildMemoBottomSheet(context, mp),
                      icon: 'assets/icon/icon_memo.png',
                      text: '메모',
                    ),
                  ],
                ),
              )
            : Container(),
        body: PageView(
          controller: _pageController,
          children: const [HomeScreen(), MyPageScreen()],
        ),
      ),
    );
  }

  Container _buildBottomNavigationBar(MainProvider mp) {
    return Container(
      width: double.infinity,
      height: 60,
      color: CustomColor.NAVIGATION_BAR_COLOR,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavigationButton(
            onPressed: () => _navigationButtonPressed(0),
            text: '홈',
            activeIcon: 'assets/icon/icon_home_active.png',
            icon: 'assets/icon/icon_home.png',
            isActive: _activeIndex == 0,
          ),
          IconButton(
            onPressed: () => mp.floatingActionButtonIsOpened =
                !mp.floatingActionButtonIsOpened,
            iconSize: 40,
            icon: Image.asset(
              'assets/icon/icon_plus.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          NavigationButton(
            onPressed: () => _navigationButtonPressed(1),
            text: '마이페이지',
            activeIcon: 'assets/icon/icon_person_active.png',
            icon: 'assets/icon/icon_person.png',
            isActive: _activeIndex == 1,
          ),
        ],
      ),
    );
  }

  void _navigationButtonPressed(int index) {
    _pageController.jumpToPage(index);
    if (index == 0) {
      setState(() => _activeIndex = 0);
    } else {
      setState(() => _activeIndex = 1);
    }
  }

  //새보드 생성 바텀시트

  Future<dynamic> _buildNewBoardMenuBottomSheet(
      BuildContext context, MainProvider mp) {
    mp.floatingActionButtonIsOpened = false;
    return showMaterialModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      backgroundColor: CustomColor.BACKGROUND_COLOR,
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 20,
            ),
            ModalTopBar(),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const BottomSheetTitle(
                  text: '보드이름',
                ),
                const SizedBox(
                  height: 12,
                ),
                const BottomSheetTextField(),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 2,
                  color: CustomColor.DIVIDER_COLOR,
                ),
                const SizedBox(
                  height: 20,
                ),
                const BottomSheetTitle(
                  text: '카테고리',
                ),
                const SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                        ),
                        itemCount: 20,
                        itemBuilder: (context, index) => Column(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.grey[300],
                            ),
                            const SizedBox(height: 4,),
                            const Text('이름', style: TextStyle(
                              color: Colors.black, fontSize: 12
                            ),)
                          ],
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //사진 추가메뉴 바텀시트
  Future<dynamic> _buildPhotoMenuBottomSheet(
      BuildContext context, MainProvider mp) {
    mp.floatingActionButtonIsOpened = false;
    return showCupertinoModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey,
      topRadius: const Radius.circular(30),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black54,
                ),
                const Text(
                  '사진/카메라',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black54,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: const Center(
                    child: Text(
                      '추가\n0/10',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BottomSheetTitle(
                  text: '제목',
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BottomSheetTitle(
                  text: '코멘트',
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //사진 보드선택메뉴 바텀시트
  Future<dynamic> _buildBoardListBottomSheet(BuildContext context) {
    return showCupertinoModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey,
      topRadius: const Radius.circular(30),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black54,
                ),
                const Text(
                  '저장할 보드',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              '베이킹 레시피 자료',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                      )),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  )),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  '새로운 보드 만들기...',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //사진 보드선택메뉴 바텀시트
  Future<dynamic> _buildMemoBottomSheet(BuildContext context, MainProvider mp) {
    mp.floatingActionButtonIsOpened = false;
    return showCupertinoModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey,
      topRadius: const Radius.circular(30),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black54,
                ),
                const Text(
                  '메모',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black54,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  //링크추가하기 바텀시트
  Future<dynamic> _buildAddLinkBottomSheet(
      BuildContext context, MainProvider mp) {
    mp.floatingActionButtonIsOpened = false;
    return showMaterialModalBottomSheet(
      context: context,
      backgroundColor: CustomColor.BACKGROUND_COLOR,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        )
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black54,
                ),
                const Text(
                  '링크추가하기',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black54,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const BottomSheetTitle(
              text: '웹링크',
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const BottomSheetTitle(
              text: '웹링크',
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModalTopBar extends StatelessWidget {
  const ModalTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const SizedBox(
              width: 32,
              height: 32,
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.black,
              )),
        ),
        const Text(
          '새보드',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const SizedBox(
            width: 32,
            height: 32,
            child: Center(
              child: Text(
                '완료',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSheetTextField extends StatelessWidget {
  const BottomSheetTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
