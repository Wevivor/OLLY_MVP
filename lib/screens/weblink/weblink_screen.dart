import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:sorty/utils/custom_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebLinkScreen extends StatefulWidget {
  const WebLinkScreen({Key? key}) : super(key: key);
  static const String id = '/weblink';

  @override
  State<WebLinkScreen> createState() => _WebLinkScreenState();
}

class _WebLinkScreenState extends State<WebLinkScreen> {
  late final ScrollController _scrollController;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  String? _title = '';
  String? height;

  @override
  void initState() {
    super.initState();
    //웹뷰 초기 실행
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
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
        body:  WebView(
          onWebViewCreated: (controller){
            _controller.complete(controller);
            },
          javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://flutter.dev',
      ),
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(onTap: (){

                  },
                      child: const SizedBox(
                          width: 32,
                          height: 32,
                          child: Icon(Icons.arrow_back_ios, size: 16,))),
                  GestureDetector(onTap: (){},
                      child: const SizedBox(
                          width: 32,
                          height: 32,
                          child: Icon(Icons.arrow_forward_ios, size: 16))),
                ],
              ),
              MaterialButton(
                onPressed: (){},
                padding: const EdgeInsets.symmetric(horizontal: 32),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: CustomColor.PRIMARY_COLOR)
                ),
                child: Text('저장하기', style: TextStyle(
                  color: CustomColor.PRIMARY_COLOR,
                  fontSize: 12
                ),),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                    width: 64,
                    child: Image.asset('assets/icon/icon_bookmark.png', width: 32, height: 32,)),
              )
            ],
          ),
        ),
      ),
    );
  }

  //앱바

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: CustomColor.APPBAR_COLOR,
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



class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                if (await controller!.canGoBack()) {
                  await controller.goBack();
                } else {
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text('No back history item')),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                if (await controller!.canGoForward()) {
                  await controller.goForward();
                } else {
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('No forward history item')),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                controller!.reload();
              },
            ),
          ],
        );
      },
    );
  }
}