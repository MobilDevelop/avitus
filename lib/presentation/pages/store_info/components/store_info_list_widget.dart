import 'package:avitus/infrasurtucture/helper_method/helper_method.dart';
import 'package:avitus/infrasurtucture/models/info.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class StoreInfoListWidget extends StatelessWidget {
  const StoreInfoListWidget({Key? key, required this.item}) : super(key: key);
  final Info item;
  @override
  Widget build(BuildContext context) {
    if (!item.type) {
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
            color: AppTheme.colors.primary.withOpacity(0.2),
            border: Border.all(color: AppTheme.colors.primary, width: 2.5),
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
                    Text(
                        HelperMedhod.toProcessCost(item.quantity.toString()) +
                            tr('store.som'),
                        style: AppTheme.data.textTheme.headline4),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppIcons.down,
                      color: AppTheme.colors.primary,
                    ),
                    Gap(ScreenSize.w8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(AppIcons.nomer, height: 16.h),
                        Gap(ScreenSize.h4),
                        Text((item.id + 1).toString(),
                            style: AppTheme.data.textTheme.headline4)
                      ],
                    ),
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
                    Text(item.paymentDate,
                        style: AppTheme.data.textTheme.headline4)
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
                    Text(item.dateOfNotice,
                        style: AppTheme.data.textTheme.headline4)
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
            color: AppTheme.colors.red.withOpacity(0.13),
            border: Border.all(color: AppTheme.colors.red, width: 2.5),
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
                    Text(
                        HelperMedhod.toProcessCost(item.quantity.toString()) +
                            tr('store.som'),
                        style: AppTheme.data.textTheme.headline4),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppIcons.up,
                      color: AppTheme.colors.red,
                    ),
                    Gap(ScreenSize.w8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(AppIcons.nomer, height: 16.h),
                        Gap(ScreenSize.h4),
                        Text((item.id + 1).toString(),
                            style: AppTheme.data.textTheme.headline4)
                      ],
                    ),
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
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                    Gap(ScreenSize.w4),
                    Text(tr('store.tolov_turi'),
                        style: AppTheme.data.textTheme.headline2),
                  ],
                ),
                Text(item.paymentType,
                    style: AppTheme.data.textTheme.headline4),
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
                    Text(item.paymentDate,
                        style: AppTheme.data.textTheme.headline4)
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
                    Text(item.paymentTime,
                        style: AppTheme.data.textTheme.headline4)
                  ],
                )
              ],
            ),
          ],
        ),
      );
}
