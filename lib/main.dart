
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sorty/providers/main_provider.dart';
import 'package:sorty/screens/category_detail/category_detail_screen.dart';
import 'package:sorty/screens/home/home_screen.dart';
import 'package:sorty/screens/login/login_screen.dart';
import 'package:sorty/screens/profile/profile_screen.dart';
import 'package:sorty/screens/register/register_screen.dart';
import 'package:sorty/screens/search_screen/search_screen.dart';
import 'package:sorty/screens/tutorial/tutorial_screen.dart';
import 'package:sorty/screens/weblink/weblink_screen.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MainProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Olly',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: LoginScreen(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          SfGlobalLocalizations.delegate
        ],
        supportedLocales: const [Locale.fromSubtags(languageCode: 'ko')],
        locale: const Locale('ko', 'KR'),
        //라우팅
        routes: {
          //사용 스크린
          LoginScreen.id: (context) => LoginScreen(),
          TutorialScreen.id: (context) => TutorialScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          WebLinkScreen.id: (context) => WebLinkScreen(),
          CategoryDetailScreen.id: (context) => CategoryDetailScreen(),


        },
      ),
    );
  }
}
