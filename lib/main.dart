import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmiis/provider/AuthProvider.dart';
import 'package:lmiis/provider/ESSPProvider.dart';
import 'package:lmiis/provider/JobProvider.dart';
import 'package:lmiis/provider/LocationProvider.dart';
import 'package:lmiis/provider/MyProfileProvider.dart';
import 'package:lmiis/provider/NewNoticePrvide.dart';
import 'package:lmiis/provider/UtilsProvider.dart';
import 'package:lmiis/provider/TrainingsProvider.dart';
import 'package:lmiis/theme/light_theme.dart';
import 'package:lmiis/views/splash_screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'di_container.dart' as di;

void main() async {
  await di.init();
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<NewsNoticeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<JobProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<TrainingsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ESSPProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<UtilProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<MyProfileProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      home: const SplashScreen(),
      theme: light,
    );
  }
}
