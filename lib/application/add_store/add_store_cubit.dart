import 'dart:io';

import 'package:avitus/application/add_store/add_store_state.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/assets/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddStoreCubit extends Cubit<AddStoreState> {
  AddStoreCubit() : super(AddStoreInitial());

  final nameController = TextEditingController();
  final nameFocus = FocusNode();

  final accountNumberController = TextEditingController();
  final accountNumberFocus = FocusNode();

  final contractNumberController = TextEditingController();
  final contractNumberFocus = FocusNode();

  final NFOController = TextEditingController();
  final NFOFocus = FocusNode();

  final INNController = TextEditingController();
  final INNFocus = FocusNode();

  late File image;
  bool chek = false;

  setImage(bool choose, context) async {
    final ImagePicker picker = ImagePicker();
    if (choose) {
      XFile? ximage = await picker.pickImage(source: ImageSource.gallery);
      if (ximage != null) {
        image = File(ximage.path);
        chek = true;
      }
    } else {
      XFile? ximage = await picker.pickImage(source: ImageSource.camera);
      if (ximage != null) {
        image = File(ximage.path);
        chek = true;
      }
    }
    Navigator.pop(context);
    emit(AddStoreInitial());
  }

  showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: Colors.black54,
                ),
                onTap: () {
                  setImage(true, context);
                },
                title: Text(
                  tr('addStore.galereya'),
                  style: AppTheme.data.textTheme.headline4,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                  color: Colors.black54,
                ),
                onTap: () {
                  setImage(false, context);
                },
                title: Text(tr('addStore.kamera'),
                    style: AppTheme.data.textTheme.headline4),
              )
            ],
          );
        });
  }
}
