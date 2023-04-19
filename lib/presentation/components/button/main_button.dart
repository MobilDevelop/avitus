import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.showLoading = false,
    this.margin,
    this.leftIcon,
    this.wrap = false,
  }) : super(key: key);

  final String text;
  final String? leftIcon;
  final VoidCallback onPressed;
  final bool showLoading;
  final bool wrap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    Widget current;

    if (showLoading) {
      current = LoadingAnimationWidget.fallingDot(
        color: AppTheme.colors.secondary,
        size: 36.h,
      );
    } else if (leftIcon != null) {
      current = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(leftIcon!),
          Gap(ScreenSize.w12),
          Text(
            text,
            style: AppTheme.data.textTheme.headline3
                ?.copyWith(color: AppTheme.colors.secondary),
          )
        ],
      );
    } else {
      current = Text(
        text,
        style: AppTheme.data.textTheme.headline3
            ?.copyWith(color: AppTheme.colors.secondary),
      );
    }

    return Bounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        width: wrap ? null : double.infinity,
        height: wrap ? null : 56.h,
        alignment: Alignment.center,
        padding: wrap
            ? EdgeInsets.symmetric(
                horizontal: ScreenSize.w16,
                vertical: ScreenSize.h8,
              )
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppTheme.colors.primary,
        ),
        margin: margin,
        child: current,
      ),
    );
  }
}
