import 'dart:convert';
import 'dart:io';
import 'package:avitus/application/add_store/add_store_state.dart';
import 'package:avitus/infrasurtucture/firebase_service/firebase_service.dart';
import 'package:avitus/infrasurtucture/models/districts.dart';
import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:avitus/infrasurtucture/models/provins.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddStoreCubit extends Cubit<AddStoreState> {
  AddStoreCubit() : super(AddStoreInitial()) {
    init();
  }

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

  final phone1Controller = TextEditingController();
  final phone1Focus = FocusNode();

  final phone2Controller = TextEditingController();
  final phone2Focus = FocusNode();

  final phone3Controller = TextEditingController();
  final phone3Focus = FocusNode();

  late File image;
  bool chek = false;

  List<Provins> provins = [];
  List<Districts> allDistricts = [];
  List<Districts> districts = [];

  Provins? selectProvins;
  Districts? selectDistrict;

  addFirm() async {
    String name = nameController.text.trim();
    String account = accountNumberController.text.trim();
    String contract = contractNumberController.text.trim();
    String nfo = NFOController.text.trim();
    String inn = INNController.text.trim();
    String phone1 = phone1Controller.text.trim();
    String phone2 = phone2Controller.text.trim();
    String phone3 = phone3Controller.text.trim();

    Firm firm = Firm(
        id: 1,
        name: name,
        image: image.path,
        provins: selectProvins,
        districts: selectDistrict,
        accountNumber: account,
        contractNumber: contract,
        nfo: nfo,
        inn: inn,
        phone1: phone1,
        phone2: phone2,
        phone3: phone3);

    RTDBService.storePostFirm(firm);
    print("saqlandi");
  }

  setProvins(Provins setProvins) {
    selectProvins = setProvins;
    selectDistrict = null;
    districts.clear();
    for (Districts element in allDistricts) {
      if (element.regionId == selectProvins!.id) {
        districts.add(element);
      }
    }
    emit(AddStoreInitial());
  }

  setDistrict(Districts setDistrict) {
    selectDistrict = setDistrict;
    emit(AddStoreInitial());
  }

  init() async {
    final String response =
        await rootBundle.loadString('assets/info/provins.json');

    final data = await json.decode(response);

    provins = provinsFromMap(data['provins']);
    allDistricts = districtsFromMap(data['districts']);
    emit(AddStoreInitial());
  }

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
