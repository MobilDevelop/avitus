import 'package:avitus/application/add_store/add_store_cubit.dart';
import 'package:avitus/application/add_store/add_store_state.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/components/button/main_button.dart';
import 'package:avitus/presentation/components/text_field.dart';
import 'package:avitus/presentation/pages/add_store/components/drop_down.dart';
import 'package:avitus/presentation/routes/index_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AddStore extends StatelessWidget {
  const AddStore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddStoreCubit, AddStoreState>(
        listener: (context, state) {
      if (state is AddStoreSucces) {
        context.go(Routes.home.path);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppTheme.colors.primary,
            content: Text(
              state.msg,
              textAlign: TextAlign.center,
              style: AppTheme.data.textTheme.headline4
                  ?.copyWith(color: AppTheme.colors.secondary),
            ),
          ),
        );
      }
    }, child: Builder(builder: (context) {
      final cubit = context.read<AddStoreCubit>();
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.colors.primary,
        ),
        body: SingleChildScrollView(
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
                                  borderRadius: BorderRadius.circular(10.r),
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
                    BlocBuilder<AddStoreCubit, AddStoreState>(
                        builder: (_, state) => DropDownProvins(
                            items: cubit.provins,
                            selected: cubit.selectProvins,
                            label: tr('addStore.viloyat'),
                            hint: tr('addStore.viloyat_tanlang'),
                            onChanged: cubit.setProvins)),
                    BlocBuilder<AddStoreCubit, AddStoreState>(
                        builder: (_, state) => DropDownDistricts(
                            items: cubit.districts,
                            selected: cubit.selectDistrict,
                            label: tr('addStore.tuman'),
                            hint: tr('addStore.tuman_tanlang'),
                            onChanged: cubit.setDistrict)),
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
                    TextFieldView(
                        controller: cubit.phone1Controller,
                        focusNode: cubit.phone1Focus,
                        chooseType: false,
                        labelText: tr('addStore.telefon'),
                        hinText: tr('addStore.telefon_raqam')),
                    TextFieldView(
                        controller: cubit.phone2Controller,
                        focusNode: cubit.phone2Focus,
                        chooseType: false,
                        labelText: tr('addStore.telefon'),
                        hinText: tr('addStore.qoshimcha')),
                    TextFieldView(
                        controller: cubit.phone3Controller,
                        focusNode: cubit.phone3Focus,
                        chooseType: false,
                        labelText: tr('addStore.telefon'),
                        hinText: tr('addStore.qoshimcha')),
                    BlocBuilder<AddStoreCubit, AddStoreState>(
                        builder: (_, state) => MainButton(
                              onPressed: cubit.addFirm,
                              text: tr('addStore.saqlash'),
                              margin: EdgeInsets.only(
                                top: 10.h,
                                bottom:
                                    MediaQuery.of(context).viewPadding.bottom,
                              ),
                              showLoading: (state is AddStoreLoading) && true,
                            ))
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
