import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotoDetailScreen extends StatefulWidget {
  const PhotoDetailScreen({Key? key}) : super(key: key);
  static const String id = '/photo';

  @override
  State<PhotoDetailScreen> createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
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
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildPhotoZone(context),
            _buildDescription()
          ],
        ),
      ),
    );
  }

  //상세 설명

  Flexible _buildDescription() {
    return Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),
          );
  }

  //사진 카라우셀

  Stack _buildPhotoZone(BuildContext context) {
    return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: PageView(
                  controller: _pageController,
                  children: [
                    Container(
                      color: Colors.black54,
                    ),
                    Container(
                      color: Colors.black54
                    ),
                    Container(
                        color: Colors.black54
                    )
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotHeight: 16,
                        dotWidth: 16,
                        strokeWidth: 5,
                        activeDotColor: Colors.grey,
                        dotColor: Colors.grey.withOpacity(0.5)
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
  }

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[500],
        title: const Text(
          '제목',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 24,
                color: Colors.black,
              ))
        ],
      );
  }
}
