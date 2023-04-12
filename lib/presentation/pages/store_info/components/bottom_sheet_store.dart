import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/components/button/border_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomShetStore {
  static bottomSheetAdd(
    context,
  ) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 700.h,
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
                  tr('store.kirim'),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Gap(40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('store.kirim_narxi'),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Gap(ScreenSize.h6),
                    SizedBox(
                      height: 50.h,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: AppTheme.colors.primary, width: 1.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: AppTheme.colors.primary, width: 1.5)),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(30.h),
                Container(
                  height: 50.h,
                  alignment: Alignment.centerLeft,
                  child: Text("    Eslatma vaqtini tanlang"),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          color: AppTheme.colors.primary, width: 1.5)),
                ),
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

  static bottomSheetRemove(context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 700.h,
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
                  tr('store.chiqim'),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Gap(40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('store.chiqim_narxi'),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Gap(ScreenSize.h6),
                    SizedBox(
                      height: 50.h,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: AppTheme.colors.primary, width: 1.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  color: AppTheme.colors.primary, width: 1.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 50.h,
                        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w4),
                        alignment: Alignment.center,
                        child: Text("naqd"),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppTheme.colors.primary),
                            color: AppTheme.colors.secondary),
                      )),
                      Expanded(
                          child: Container(
                        height: 50.h,
                        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w4),
                        alignment: Alignment.center,
                        child: Text("karta"),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppTheme.colors.primary),
                            color: AppTheme.colors.secondary),
                      )),
                      Expanded(
                          child: Container(
                        height: 50.h,
                        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w4),
                        alignment: Alignment.center,
                        child: Text("bank"),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppTheme.colors.primary),
                            color: AppTheme.colors.secondary),
                      )),
                    ],
                  ),
                  Gap(ScreenSize.h24),
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
            ],
          ),
        );
      },
    );
  }
}
