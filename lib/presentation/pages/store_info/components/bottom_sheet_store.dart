import 'package:avitus/application/add_store/add_store_index.dart';
import 'package:avitus/application/store_info/store_info_cubit.dart';
import 'package:avitus/application/store_info/store_info_state.dart';
import 'package:avitus/presentation/components/button/border_button.dart';
import 'package:avitus/presentation/components/button/color_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BottomShetStore {
  static bottomSheetAdd(context, String idName) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => StoreInfoCubit(""),
          child: BlocListener<StoreInfoCubit, StoreInfoState>(
            listener: (context, state) async {
              if (state is StoreInfoSucces) {
                Navigator.pop(context);
              }
              if (state is StoreInfoError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppTheme.colors.primary,
                    content: Text(state.msg,
                        textAlign: TextAlign.center,
                        style: AppTheme.data.textTheme.subtitle1!
                            .copyWith(color: AppTheme.colors.secondary)),
                  ),
                );
              }
            },
            child: Builder(builder: (context) {
              final cubit = context.read<StoreInfoCubit>();
              return Container(
                height: 700.h,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 20),
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
                      Text(tr('store.kirim'),
                          style: AppTheme.data.textTheme.headline5),
                      Gap(20.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr('store.kirim_narxi'),
                              style: AppTheme.data.textTheme.subtitle2),
                          Gap(ScreenSize.h6),
                          SizedBox(
                            height: 50.h,
                            child: TextField(
                              controller: cubit.inputPriceController,
                              focusNode: cubit.inputPriceFocus,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: false,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                    mask: '##########',
                                    filter: {"#": RegExp(r'[0-9]')},
                                    type: MaskAutoCompletionType.lazy)
                              ],
                              decoration: InputDecoration(
                                hintText: tr('store.summa'),
                                hintStyle: AppTheme.data.textTheme.bodyText2,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                        color: AppTheme.colors.primary,
                                        width: 1.5)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                        color: AppTheme.colors.primary,
                                        width: 1.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(30.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr('store.eslatma'),
                              style: AppTheme.data.textTheme.subtitle2),
                          Gap(ScreenSize.h6),
                          BlocBuilder<StoreInfoCubit, StoreInfoState>(
                            builder: (_, state) => Container(
                              height: 50.h,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: ScreenSize.w12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cubit.noticeDate.isEmpty
                                        ? tr('store.sana')
                                        : cubit.noticeDate,
                                    style: cubit.noticeDate.isEmpty
                                        ? AppTheme.data.textTheme.bodyText2
                                        : AppTheme.data.textTheme.headline4,
                                  ),
                                  IconButton(
                                      onPressed: () =>
                                          cubit.selectNoticeDate(context),
                                      icon: Icon(Icons.calendar_month_outlined))
                                ],
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: AppTheme.colors.primary,
                                      width: 1.5)),
                            ),
                          ),
                        ],
                      )
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: BorderButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: tr('home.bekor_qilish'),
                              borderColor: AppTheme.colors.red),
                        ),
                        Gap(15.h),
                        Expanded(
                            child: BorderButton(
                          onPressed: () {
                            cubit.addInfo(true, idName);
                          },
                          text: tr('home.tasdiqlash'),
                        ))
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }

  static bottomSheetRemove(context, String idName) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => StoreInfoCubit(""),
          child: BlocListener<StoreInfoCubit, StoreInfoState>(
            listener: (context, state) async {
              if (state is StoreInfoSucces) {
                Navigator.pop(context);
              }
              if (state is StoreInfoError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppTheme.colors.primary,
                    content: Text(state.msg,
                        textAlign: TextAlign.center,
                        style: AppTheme.data.textTheme.subtitle1!
                            .copyWith(color: AppTheme.colors.secondary)),
                  ),
                );
              }
            },
            child: Builder(builder: (context) {
              final cubit = context.read<StoreInfoCubit>();
              return Container(
                height: 700.h,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 20),
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
                      Text(tr('store.chiqim'),
                          style: AppTheme.data.textTheme.headline5),
                      Gap(40.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr('store.chiqim_narxi'),
                              style: AppTheme.data.textTheme.subtitle2),
                          Gap(ScreenSize.h6),
                          SizedBox(
                            height: 50.h,
                            child: TextField(
                              controller: cubit.outputPriceController,
                              focusNode: cubit.outputPriceFocus,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                    mask: '##########',
                                    filter: {"#": RegExp(r'[0-9]')},
                                    type: MaskAutoCompletionType.lazy)
                              ],
                              enableInteractiveSelection: false,
                              decoration: InputDecoration(
                                hintText: tr('store.summa'),
                                hintStyle: AppTheme.data.textTheme.bodyText2,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                        color: AppTheme.colors.primary,
                                        width: 1.5)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                        color: AppTheme.colors.primary,
                                        width: 1.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    Column(
                      children: [
                        BlocBuilder<StoreInfoCubit, StoreInfoState>(
                            builder: (_, state) => Row(
                                  children: [
                                    Expanded(
                                        child: ColorButton(
                                            onPressed: () =>
                                                cubit.chooseType(1),
                                            backgroundColor:
                                                cubit.typeIndex == 1
                                                    ? AppTheme.colors.primary
                                                    : null,
                                            text: tr('store.naqd'))),
                                    Expanded(
                                        child: ColorButton(
                                            onPressed: () =>
                                                cubit.chooseType(2),
                                            backgroundColor:
                                                cubit.typeIndex == 2
                                                    ? AppTheme.colors.primary
                                                    : null,
                                            text: tr('store.karta'))),
                                    Expanded(
                                        child: ColorButton(
                                            onPressed: () =>
                                                cubit.chooseType(3),
                                            backgroundColor:
                                                cubit.typeIndex == 3
                                                    ? AppTheme.colors.primary
                                                    : null,
                                            text: tr('store.bank'))),
                                  ],
                                )),
                        Gap(ScreenSize.h24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: BorderButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  text: tr('home.bekor_qilish'),
                                  borderColor: AppTheme.colors.red),
                            ),
                            Gap(15.h),
                            Expanded(
                                child: BorderButton(
                              onPressed: () {
                                cubit.addInfo(false, idName);
                              },
                              text: tr('home.tasdiqlash'),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
