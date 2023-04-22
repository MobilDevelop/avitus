import 'add_store_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddStoreCubit extends Cubit<AddStoreState> {
  AddStoreCubit(Firm? firm) : super(AddStoreInitial()) {
    init(firm);
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

  bool enebled = true;

  chooseFirm(Firm? firm) {
    emit(AddStoreLoading());
    if (firm == null) {
      addFirm();
    } else {
      editFirm(firm);
    }
  }

  editFirm(Firm firm) {
    String name = nameController.text.trim();
    String account = accountNumberController.text.trim();
    String contract = contractNumberController.text.trim();
    String imagePath = nullImage ? "" : image.path;
    String nfo = NFOController.text.trim();
    String inn = INNController.text.trim();
    String phone1 = phone1Controller.text.trim();
    String phone2 = phone2Controller.text.trim();
    String phone3 = phone3Controller.text.trim();

    Firm editFirm = Firm(
        id: firm.id,
        key: firm.key,
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
    RTDBService.storePutFirm(editFirm);
    emit(AddStoreSucces(tr('addStore.yangilandi')));
  }

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
          key: '',
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
          key: '',
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

  setProvins(Provins? setProvins) {
    if (setProvins != null) {
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
  }

  setDistrict(Districts setDistrict) {
    selectDistrict = setDistrict;
    emit(AddStoreInitial());
  }

  init(Firm? firm) async {
    final String response =
        await rootBundle.loadString('assets/info/provins.json');

    final data = await json.decode(response);

    provins = provinsFromMap(data['provins']);
    allDistricts = districtsFromMap(data['districts']);
    if (firm != null) {
      nameController.text = firm.name!;
      accountNumberController.text = firm.accountNumber!;
      contractNumberController.text = firm.contractNumber!;
      NFOController.text = firm.nfo!;
      INNController.text = firm.inn!;
      phone1Controller.text = firm.phone1!;
      phone2Controller.text = firm.phone2!;
      phone3Controller.text = firm.phone3!;
      selectProvins = firm.provins;
      if (firm.image!.isNotEmpty) {
        image = File(firm.image!);
        nullImage = false;
        chek = true;
      }
      enebled = false;
      setProvins(firm.provins);
      selectDistrict = firm.districts;
    }
    emit(AddStoreInitial());
  }

  setEnebled() {
    enebled = !enebled;
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

  @override
  Future<void> close() {
    nameController.dispose();
    nameFocus.dispose();

    accountNumberController.dispose();
    accountNumberFocus.dispose();

    contractNumberController.dispose();
    contractNumberFocus.dispose();

    NFOController.dispose();
    NFOFocus.dispose();

    INNController.dispose();
    INNFocus.dispose();

    phone1Controller.dispose();
    phone1Focus.dispose();

    phone2Controller.dispose();
    phone2Focus.dispose();

    phone3Controller.dispose();
    phone3Focus.dispose();

    return super.close();
  }
}
