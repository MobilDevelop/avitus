import 'dart:convert';
import 'dart:io';

import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({super.key, required this.firm});

  final Firm firm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      margin: EdgeInsets.symmetric(vertical: ScreenSize.h8),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.colors.primary, width: 1.5),
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 70.h,
                width: 70.h,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppTheme.colors.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(10.r)),
                child: firm.image!.isEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          AppIcons.noImage,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(9.r),
                        child: Image.memory(
                          base64Decode(firm.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Gap(ScreenSize.w20),
              Expanded(
                child: Text(
                  firm.name!.isEmpty ? tr('home.empty_name') : firm.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                ),
              ),
            ],
          ),
          Gap(ScreenSize.h20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr('home.hisob_raqam'),
                      style: AppTheme.data.textTheme.headline2),
                  Gap(ScreenSize.h4),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 120.w,
                    child: Text(
                        firm.accountNumber!.isEmpty
                            ? tr('home.mavjud_emas')
                            : firm.accountNumber!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.data.textTheme.headline4),
                  )
                ],
              ),
              SvgPicture.asset(
                AppIcons.leftRight,
                height: 23.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(tr('home.shartnoma_raqam'),
                      style: AppTheme.data.textTheme.headline2),
                  Gap(ScreenSize.h4),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 120.w,
                    child: Text(
                        firm.contractNumber!.isEmpty
                            ? tr('home.mavjud_emas')
                            : firm.contractNumber!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.data.textTheme.headline4),
                  )
                ],
              )
            ],
          ),
          Gap(ScreenSize.h20),
          Row(
            children: [
              SvgPicture.asset(AppIcons.location, height: 25.h),
              Gap(ScreenSize.w12),
              Expanded(
                child: Text(
                    '${firm.provins == null ? tr('home.joylashuv') : firm.provins!.name} ${firm.districts == null ? '' : firm.districts!.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTheme.data.textTheme.bodyText1),
              )
            ],
          )
        ],
      ),
    );
  }
}
