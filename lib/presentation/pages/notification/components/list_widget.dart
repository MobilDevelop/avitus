import 'package:avitus/infrasurtucture/helper_method/helper_method.dart';
import 'package:avitus/infrasurtucture/models/info.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({Key? key, required this.item})
      : super(key: key);
  final Info item;
  @override
  Widget build(BuildContext context) {
    return inputTime();
  }

  Widget inputTime() => Container(
        height: 180.h,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.only(
            left: ScreenSize.w10,
            right: ScreenSize.w10,
            top: ScreenSize.h20,
            bottom: ScreenSize.h14),
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.colors.red, width: 2.5),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(item.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.data.textTheme.headline4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr('store.miqdori'),
                    style: AppTheme.data.textTheme.headline4),
                Gap(ScreenSize.w4),
                Text(
                    HelperMedhod.toProcessCost(item.quantity.toString()) +
                        tr('store.som'),
                    style: AppTheme.data.textTheme.headline4!
                        .copyWith(color: AppTheme.colors.red)),
              ],
            ),
            Gap(ScreenSize.h24),
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
}
