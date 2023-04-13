import 'package:avitus/application/add_store/add_store_cubit.dart';
import 'package:avitus/application/add_store/add_store_state.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/assets/theme/app_theme.dart';
import 'package:avitus/presentation/components/button/border_button.dart';
import 'package:avitus/presentation/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AddStore extends StatelessWidget {
  const AddStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = context.read<AddStoreCubit>();
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.colors.primary,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenSize.h16, horizontal: ScreenSize.w10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BlocBuilder<AddStoreCubit, AddStoreState>(
                              builder: (_, state) => InkWell(
                                    onTap: () async {
                                      cubit.showPicker(context);
                                    },
                                    child: Container(
                                      height: 116.h,
                                      width: 116.h,
                                      decoration: BoxDecoration(
                                        color: AppTheme.colors.secondary,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: cubit.chek
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Image.file(
                                                cubit.image,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : SvgPicture.asset(
                                              AppIcons.camera,
                                              fit: BoxFit.scaleDown,
                                            ),
                                    ),
                                  )),
                          Gap(ScreenSize.h14),
                          TextFieldView(
                              controller: cubit.nameController,
                              focusNode: cubit.nameFocus,
                              chooseType: false,
                              labelText: tr('addStore.ferma'),
                              hinText: tr('addStore.nomi')),
                          TextFieldView(
                              controller: cubit.accountNumberController,
                              focusNode: cubit.accountNumberFocus,
                              chooseType: false,
                              labelText: tr('addStore.hisob_raqam'),
                              hinText: tr('addStore.hisob_raqam_kiriting')),
                          TextFieldView(
                              controller: cubit.contractNumberController,
                              focusNode: cubit.contractNumberFocus,
                              chooseType: false,
                              labelText: tr('addStore.shartnoma_raqam'),
                              hinText: tr('addStore.shartnoma_raqam_kiriting')),
                          TextFieldView(
                              controller: cubit.NFOController,
                              focusNode: cubit.NFOFocus,
                              chooseType: false,
                              labelText: tr('addStore.nfo'),
                              hinText: tr('addStore.nfo_kiriting')),
                          TextFieldView(
                              controller: cubit.INNController,
                              focusNode: cubit.INNFocus,
                              chooseType: false,
                              labelText: tr('addStore.inn'),
                              hinText: tr('addStore.inn_kiriting')),
                        ],
                      ),
                      // ButtonTheme(
                      //   minWidth: size.width,
                      //   height: 55,
                      //   child: OutlineButton(
                      //       onPressed: () {
                      //         provider.saveInfo(context);
                      //       },
                      //       child: Text(
                      //         "SAQLASH",
                      //         style: TextStyle(
                      //             color: ColorHex.colorFromHex("#44B71C"),
                      //             fontSize: 16),
                      //       ),
                      //       borderSide:
                      //           BorderSide(color: ColorHex.colorFromHex("#44B71C")),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(15))),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: ScreenSize.h18,
                  left: ScreenSize.w10,
                  right: ScreenSize.w10),
              child: BorderButton(onPressed: () {}, text: "OK"),
            )
          ],
        ),
      );
    });
  }
}
