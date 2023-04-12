import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/components/button/border_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomShettHome {
  static bottomSheetHome(context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 500.h,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
          decoration: BoxDecoration(
              color: AppTheme.colors.secondary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Container(
                  height: 6.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.black,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Gap(10.h),
                Text(
                  tr('home.saralash'),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Gap(40.h),
                Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text("   Viloyatni tanlang"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          color: AppTheme.colors.primary, width: 1.5)),
                ),
                Gap(30.h),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text("    Tumanni tanlang"),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          color: AppTheme.colors.primary, width: 1.5)),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BorderButton(
                        onPressed: () {},
                        text: tr('home.bekor_qilish'),
                        borderColor: AppTheme.colors.red),
                  ),
                  Gap(15.h),
                  Expanded(
                      child: BorderButton(
                    onPressed: () {},
                    text: tr('home.tasdiqlash'),
                  ))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
