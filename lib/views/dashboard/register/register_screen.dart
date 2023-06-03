import 'package:kheloo/utils/ui_text_style.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Center(child: Text("Register", style: UITextStyle.blackTextStyle(fontSize: 55,color: AppColor.yellowColorAlt),)),
    );  }
}