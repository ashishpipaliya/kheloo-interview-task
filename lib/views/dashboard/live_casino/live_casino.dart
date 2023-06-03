import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:kheloo/utils/ui_text_style.dart';
import 'package:flutter/material.dart';

class LiveCasinoScreen extends StatelessWidget {
  const LiveCasinoScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Center(child: Text("Live Casino", style: UITextStyle.blackTextStyle(fontSize: 55, color: AppColor.yellowColorAlt),)),
    );
  }
}