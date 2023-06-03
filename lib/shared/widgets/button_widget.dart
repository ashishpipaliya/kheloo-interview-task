import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final double radius;
  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? titleStyle;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const ButtonWidget(
      {super.key,
      this.radius = 12,
      required this.title,
      this.color,
      this.width,
      this.height,
      this.titleStyle,
      this.icon,
      this.padding,
      this.onTap, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.yellowColorAlt.withOpacity(0.3),
                offset: const Offset(0.0, 5.0),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              )
            ],
            color: color ?? AppColor.yellowColor,
            borderRadius: BorderRadius.circular(radius)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) SizedBox(width: 24, height: 24, child: icon!),
            if (icon != null) const SizedBox(width: 12),
            Text(title,
                style: titleStyle ??
                    TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white),
                maxLines: 1),
          ],
        ),
      ),
    );
  }
}
