import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/helper/app_theme.dart';
import 'package:task_app/helper/prefe.dart';
import 'package:task_app/helper/un_foucs.dart';
import 'package:task_app/screens/home/bloc/bloc.dart';
import 'package:task_app/screens/home/view.dart';
import 'package:task_app/screens/kiwi.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  Prefs.init();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/langs',
      saveLocale: true,
      startLocale: const Locale('en'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    Prefs.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Task App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: navigator,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          builder: (context, widget) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: UnFocus(child: widget!),
          ),
          home: child,
        );
      },
      child: const HomeView(),
    );
  }
}
