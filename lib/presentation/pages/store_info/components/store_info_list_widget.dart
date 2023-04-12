import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class StoreInfoListWidget extends StatelessWidget {
  const StoreInfoListWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0) {
      return payTime();
    }
    return inputTime();
  }

  Widget inputTime() => Container(
        height: 160.h,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.only(
            left: ScreenSize.w10,
            right: ScreenSize.w10,
            top: ScreenSize.h20,
            bottom: ScreenSize.h14),
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.colors.primary, width: 1.5),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(tr('store.miqdori'),
                        style: AppTheme.data.textTheme.headline2),
                    Gap(ScreenSize.w4),
                    Text("120 mln", style: AppTheme.data.textTheme.headline4),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AppIcons.nomer, height: 16.h),
                    Gap(ScreenSize.h4),
                    Text("12", style: AppTheme.data.textTheme.headline4)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr('store.tolov_sanasi'),
                        style: AppTheme.data.textTheme.headline2),
                    Gap(ScreenSize.h4),
                    Text("11.04.2023", style: AppTheme.data.textTheme.headline4)
                  ],
                ),
                SvgPicture.asset(
                  AppIcons.leftRight,
                  height: 22.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(tr('store.eslatma_sanasi'),
                        style: AppTheme.data.textTheme.headline2),
                    Gap(ScreenSize.h4),
                    Text("11.07.2023", style: AppTheme.data.textTheme.headline4)
                  ],
                )
              ],
            ),
          ],
        ),
      );

  Widget payTime() => Container(
        height: 180.h,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: ScreenSize.h8),
        padding: EdgeInsets.only(
            left: ScreenSize.w10,
            right: ScreenSize.w10,
            top: ScreenSize.h14,
            bottom: ScreenSize.h12),
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(tr('store.miqdori'),
                        style: AppTheme.data.textTheme.headline2),
                    Gap(ScreenSize.w4),
                    Text("120 mln", style: AppTheme.data.textTheme.headline4),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AppIcons.nomer, height: 16.h),
                    Gap(ScreenSize.h4),
                    Text("12", style: AppTheme.data.textTheme.headline4)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: ScreenSize.h24,
                      width: ScreenSize.w32,
                      decoration: BoxDecoration(
                          color: AppTheme.colors.primary,
                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                    Gap(ScreenSize.w4),
                    Text(tr('store.tolov_turi'),
                        style: AppTheme.data.textTheme.headline2),
                  ],
                ),
                Text("Naqd", style: AppTheme.data.textTheme.headline4),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr('store.tolov_sanasi'),
                        style: AppTheme.data.textTheme.headline2),
                    Gap(ScreenSize.h4),
                    Text("11.04.2023", style: AppTheme.data.textTheme.headline4)
                  ],
                ),
                SvgPicture.asset(
                  AppIcons.leftRight,
                  height: 22.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(tr('store.tolov_vaqti'),
                        style: AppTheme.data.textTheme.headline2),
                    Gap(ScreenSize.h4),
                    Text("11:25:23", style: AppTheme.data.textTheme.headline4)
                  ],
                )
              ],
            ),
          ],
        ),
      );
}
