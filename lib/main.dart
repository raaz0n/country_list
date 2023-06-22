import 'dart:async';

import 'package:country_list/src/common/themes/theme_color.dart';
import 'package:country_list/src/dependency_injection/get_it.dart' as getIt;
import 'package:country_list/src/features/country_list/presentation/pages/home_pages.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: AppColor.vulcan,
        ),
      ),
      home: const HomePageScreen(),
    );
  }
}
