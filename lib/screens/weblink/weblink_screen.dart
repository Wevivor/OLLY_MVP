import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

class WebLinkScreen extends StatefulWidget {
  const WebLinkScreen({Key? key}) : super(key: key);
  static const String id = '/weblink';

  @override
  State<WebLinkScreen> createState() => _WebLinkScreenState();
}

class _WebLinkScreenState extends State<WebLinkScreen> {
  late final ScrollController _scrollController;
  String? _title = '';
  String? height;

  @override
  void initState() {
    super.initState();
    //웹뷰 초기 실행
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    //스크롤 컨트롤러 초기화
    _scrollController = ScrollController();
    //메타데이터 패칭
    Future.delayed(Duration.zero, () async {
      fetchMetadata('https://flutter.dev');
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        body: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                InAppWebView(
                  initialUrlRequest:
                      URLRequest(url: Uri.parse('https://flutter.dev')),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  //앱바

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[500],
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '$_title',
              style: const TextStyle(
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16),
            ),
            const Text(
              'https://flutter.dev',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            )
          ],
        ),
      ),
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.black,
          )),
    );
  }

  //url => Metadata 추출

  Future<void> fetchMetadata(String url) async {
    Metadata? data = await MetadataFetch.extract(url);
    setState(() {
      _title = data?.title;
    });
  }
}
