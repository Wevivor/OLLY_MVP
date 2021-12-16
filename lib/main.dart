import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sorty/providers/main_provider.dart';
import 'package:sorty/screens/board_list/board_list_screen.dart';
import 'package:sorty/screens/home/home_screen.dart';
import 'package:sorty/screens/link_detail/link_detail_screen.dart';
import 'package:sorty/screens/login/login_screen.dart';
import 'package:sorty/screens/main/main_screen.dart';
import 'package:sorty/screens/memo/memo_screen.dart';
import 'package:sorty/screens/my_board/my_board_screen.dart';
import 'package:sorty/screens/photo_detail/photo_detail_screen.dart';
import 'package:sorty/screens/photo_update/photo_update_screen.dart';
import 'package:sorty/screens/profile/profile_screen.dart';
import 'package:sorty/screens/push_alarm/push_alarm_screen.dart';
import 'package:sorty/screens/remind_alarm/remind_alarm_screen.dart';
import 'package:sorty/screens/remind_alarm_setting/remind_alarm_setting_screen.dart';
import 'package:sorty/screens/search_screen/search_screen.dart';
import 'package:sorty/screens/settings/settings_screen.dart';
import 'package:sorty/screens/weblink/weblink_screen.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
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
          //네비게이션 스크린
          MainScreen.id: (context) => MainScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          //스크린
          LoginScreen.id: (context) => LoginScreen(),
          MyBoardScreen.id: (context) => MyBoardScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          BoardListScreen.id: (context) => BoardListScreen(),
          LinkDetailScreen.id: (context) => LinkDetailScreen(),
          PhotoDetailScreen.id: (context) => PhotoDetailScreen(),
          PhotoUpdateScreen.id: (context) => PhotoUpdateScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          MemoScreen.id: (context) => MemoScreen(),
          WebLinkScreen.id: (context) => WebLinkScreen(),
          RemindAlarmScreen.id: (context) => RemindAlarmScreen(),
          RemindAlarmSettingScreen.id: (context) => RemindAlarmSettingScreen(),
          PushAlarmScreen.id: (context) => PushAlarmScreen(),
          SettingsScreen.id: (context) => SettingsScreen(),
        },
      ),
    );
  }
}
