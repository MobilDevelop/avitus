import 'package:avitus/application/add_store/add_store_cubit.dart';
import 'package:avitus/application/add_store/add_store_state.dart';
import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/components/button/main_button.dart';
import 'package:avitus/presentation/components/text_field.dart';
import 'package:avitus/presentation/pages/add_store/components/drop_down.dart';
import 'package:avitus/presentation/pages/add_store/components/phone_textfield.dart';
import 'package:avitus/presentation/routes/index_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AddStore extends StatelessWidget {
  const AddStore({super.key, required this.firm});
  final Firm? firm;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddStoreCubit(firm),
      child: BlocListener<AddStoreCubit, AddStoreState>(
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
              actions: [
                Visibility(
                    visible: firm != null,
                    child: IconButton(
                        onPressed: cubit.setEnebled, icon: Icon(Icons.edit)))
              ],
            ),
            body: BlocBuilder<AddStoreCubit, AddStoreState>(
                builder: (_, state) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenSize.h16,
                            horizontal: ScreenSize.w10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (cubit.enebled) {
                                      cubit.showPicker(context);
                                    }
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
                                ),
                                Gap(ScreenSize.h14),
                                TextFieldView(
                                    controller: cubit.nameController,
                                    focusNode: cubit.nameFocus,
                                    enebled: cubit.enebled,
                                    chooseType: false,
                                    labelText: tr('addStore.ferma'),
                                    hinText: tr('addStore.nomi')),
                                BlocBuilder<AddStoreCubit, AddStoreState>(
                                    builder: (_, state) => DropDownProvins(
                                        items: cubit.provins,
                                        selected: cubit.selectProvins,
                                        enebled: cubit.enebled,
                                        label: tr('addStore.viloyat'),
                                        hint: tr('addStore.viloyat_tanlang'),
                                        onChanged: cubit.setProvins)),
                                BlocBuilder<AddStoreCubit, AddStoreState>(
                                    builder: (_, state) => DropDownDistricts(
                                        items: cubit.districts,
                                        selected: cubit.selectDistrict,
                                        enebled: cubit.enebled,
                                        label: tr('addStore.tuman'),
                                        hint: tr('addStore.tuman_tanlang'),
                                        onChanged: cubit.setDistrict)),
                                TextFieldView(
                                    controller: cubit.accountNumberController,
                                    focusNode: cubit.accountNumberFocus,
                                    enebled: cubit.enebled,
                                    chooseType: true,
                                    labelText: tr('addStore.hisob_raqam'),
                                    hinText:
                                        tr('addStore.hisob_raqam_kiriting')),
                                TextFieldView(
                                    controller: cubit.contractNumberController,
                                    focusNode: cubit.contractNumberFocus,
                                    enebled: cubit.enebled,
                                    chooseType: true,
                                    labelText: tr('addStore.shartnoma_raqam'),
                                    hinText: tr(
                                        'addStore.shartnoma_raqam_kiriting')),
                                TextFieldView(
                                    controller: cubit.NFOController,
                                    focusNode: cubit.NFOFocus,
                                    enebled: cubit.enebled,
                                    chooseType: false,
                                    labelText: tr('addStore.nfo'),
                                    hinText: tr('addStore.nfo_kiriting')),
                                TextFieldView(
                                    controller: cubit.INNController,
                                    focusNode: cubit.INNFocus,
                                    enebled: cubit.enebled,
                                    chooseType: false,
                                    labelText: tr('addStore.inn'),
                                    hinText: tr('addStore.inn_kiriting')),
                                PhoneTextFieldView(
                                    controller: cubit.phone1Controller,
                                    focusNode: cubit.phone1Focus,
                                    enebled: cubit.enebled,
                                    labelText: tr('addStore.telefon')),
                                PhoneTextFieldView(
                                    controller: cubit.phone2Controller,
                                    focusNode: cubit.phone2Focus,
                                    enebled: cubit.enebled,
                                    labelText: tr('addStore.telefon')),
                                PhoneTextFieldView(
                                    controller: cubit.phone3Controller,
                                    focusNode: cubit.phone3Focus,
                                    enebled: cubit.enebled,
                                    labelText: tr('addStore.telefon')),
                                BlocBuilder<AddStoreCubit, AddStoreState>(
                                    builder: (_, state) => MainButton(
                                          onPressed: () {
                                            if (cubit.enebled) {
                                              cubit.chooseFirm(firm);
                                            }
                                          },
                                          text: tr('addStore.saqlash'),
                                          margin: EdgeInsets.only(
                                            top: 10.h,
                                            bottom: MediaQuery.of(context)
                                                .viewPadding
                                                .bottom,
                                          ),
                                          showLoading:
                                              (state is AddStoreLoading) &&
                                                  true,
                                        ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )));
      })),
    );
  }
}
