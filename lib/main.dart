import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/dashboard/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kheloo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme:  AppBarTheme(surfaceTintColor: Colors.transparent, color: AppColor.darkBlueColor),
        scaffoldBackgroundColor: AppColor.blackColor,
      ),
      home: const Dashboard(),
    );
  }
}
