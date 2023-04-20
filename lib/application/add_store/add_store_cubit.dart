import 'add_store_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool nullImage = true;
  bool chek = false;

  List<Provins> provins = [];
  List<Districts> allDistricts = [];
  List<Districts> districts = [];

  Provins? selectProvins;
  Districts? selectDistrict;

  addFirm() async {
    List<Firm> firms = await RTDBService.loadPostFirm();
    firms.sort(
      (a, b) => a.id.compareTo(b.id),
    );
    emit(AddStoreLoading());
    String name = nameController.text.trim();
    String account = accountNumberController.text.trim();
    String contract = contractNumberController.text.trim();
    String imagePath = nullImage ? "" : image.path;
    String nfo = NFOController.text.trim();
    String inn = INNController.text.trim();
    String phone1 = phone1Controller.text.trim();
    String phone2 = phone2Controller.text.trim();
    String phone3 = phone3Controller.text.trim();

    if (firms.isEmpty) {
      Firm firm = Firm(
          id: 0,
          name: name,
          image: imagePath,
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
    } else {
      Firm firm = Firm(
          id: firms.last.id + 1,
          name: name,
          image: imagePath,
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
    }

    emit(AddStoreSucces(tr('addStore.saqlandi')));
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
        nullImage = false;
      }
    } else {
      XFile? ximage = await picker.pickImage(source: ImageSource.camera);
      if (ximage != null) {
        image = File(ximage.path);
        chek = true;
        nullImage = false;
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
