import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:kheloo/utils/ui_text_style.dart';
import 'package:flutter/material.dart';

class SportsScreem extends StatelessWidget {
  const SportsScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: Center(child: Text("Sports", style: UITextStyle.blackTextStyle(fontSize: 55, color: AppColor.yellowColorAlt),)),
    );
  }
}