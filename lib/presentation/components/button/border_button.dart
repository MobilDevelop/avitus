// Created by Muhammed Tolkinov on 31-October-2022

import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/assets/res/screen_size.dart';
import 'package:avitus/presentation/assets/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.borderColor,
    this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? borderColor;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    Widget current = Text(
      text,
      style: AppTheme.data.textTheme.subtitle2
          ?.copyWith(color: borderColor ?? AppTheme.colors.text900),
    );

    if (icon != null) {
      current = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          current,
          Gap(ScreenSize.w12),
          SvgPicture.asset(
            icon!,
            color: borderColor ?? AppTheme.colors.text900,
          )
        ],
      );
    }

    return f_bounce.Bounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: icon != null ? 0 : ScreenSize.w24,
            vertical: ScreenSize.h12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: borderColor ?? AppTheme.colors.primary)),
        alignment: Alignment.center,
        child: current,
      ),
    );
  }
}
