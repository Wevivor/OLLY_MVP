import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sorty/components/buttons/tutorial_button.dart';
import 'package:sorty/screens/register/register_screen.dart';
import 'package:sorty/utils/custom_color.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);
  static const String id = '/tutorial';

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  int _currentIndex = 0;


  @override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: CustomColor.BACKGROUND_COLOR,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: LinearProgressIndicator(
          value: statusValue(_currentIndex),
          minHeight: 10,
          color: CustomColor.PRIMARY_COLOR,
          backgroundColor: HexColor('#F1F1F1'),
        ),
      ),
      body: PageView(
        pageSnapping: false,
        physics: const NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: [
          _buildTutorialPage1(),
          _buildTutorialPage2(),
          _buildTutorialPage3()
        ],
      ),
    ));
  }

  Widget _buildTutorialPage1() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '외부에서 한번의 터치로  앱 내부에서 플러스만 누르면 웹링크 창에 링크 자동 입력 되어 있음',
            textAlign: TextAlign.center,
          ),
          TutorialButton(
            context: context,
            buttonText: '',
            onPressed: () {
              setState(() {
                _pageController.jumpToPage(1);
              });
            }
          )
        ],
      ),
    );
  }

  Widget _buildTutorialPage2() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '외부에서 한번의 터치로  앱 내부에서 플러스만 누르면 웹링크 창에 링크 자동 입력 되어 있음',
            textAlign: TextAlign.center,
          ),
          TutorialButton(
            context: context,
            onPressed: () {
              setState(() {
                _pageController.jumpToPage(2);
              });
            },
            buttonText: '',
          )
        ],
      ),
    );
  }

  Widget _buildTutorialPage3() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '외부에서 한번의 터치로  앱 내부에서 플러스만 누르면 웹링크 창에 링크 자동 입력 되어 있음',
            textAlign: TextAlign.center,
          ),
          TutorialButton(
            context: context,
            buttonText: '',
              onPressed: () => Navigator.pushReplacementNamed(context, RegisterScreen.id)
          )
        ],
      ),
    );
  }

  double statusValue(index) {
    switch (index) {
      case 0:
        return 0.33;
      case 1:
        return 0.66;
      case 2:
        return 1;
      default:
        return 0;
    }
  }
}
