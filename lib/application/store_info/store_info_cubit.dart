import 'package:avitus/application/home/home_index.dart';
import 'package:avitus/application/store_info/store_info_state.dart';
import 'package:avitus/infrasurtucture/helper_method/helper_method.dart';
import 'package:avitus/infrasurtucture/models/info.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class StoreInfoCubit extends Cubit<StoreInfoState> {
  StoreInfoCubit(String name) : super(StoreInfoInit()) {
    init(name);
  }

  final inputPriceController = TextEditingController();
  final inputPriceFocus = FocusNode();

  final outputPriceController = TextEditingController();
  final outputPriceFocus = FocusNode();

  List<Info> items = [];
  int allSumm = 0;

  int typeIndex = 0;

  String noticeDate = '';

  void init(String name) async {
    allSumm = 0;
    if (name.isNotEmpty) {
      List<Info> noSort = await RTDBService.loadPostInfo(name);
      noSort.sort(
        (a, b) => a.id.compareTo(b.id),
      );

      items = noSort.reversed.toList();

      for (Info item in items) {
        if (item.type) {
          allSumm += item.quantity;
        } else {
          allSumm -= item.quantity;
        }
      }
      emit(StoreInfoInit());
    }
  }

  void addInfo(bool type, Firm firm) async {
    List<Info> test = await RTDBService.loadPostInfo(firm.id.toString());
    test.sort(
      (a, b) => a.id.compareTo(b.id),
    );
    String date = HelperMedhod.formatDate(DateTime.now());
    String time = HelperMedhod.formatTime();
    String quantity = '';
    if (type) {
      quantity = inputPriceController.text.trim();
      if (quantity.isEmpty || noticeDate.isEmpty) {
        emit(StoreInfoError(tr('store.error')));
        return;
      }
    } else {
      quantity = outputPriceController.text.trim();
      if (quantity.isEmpty || typeIndex == 0) {
        emit(StoreInfoError(tr('store.error')));
        return;
      }
    }
    if (test.isEmpty) {
      Info info = Info(
          id: 0,
          name: firm.name!,
          type: type,
          pay: false,
          quantity: int.parse(quantity),
          paymentType: HelperMedhod.chooseType(typeIndex),
          paymentDate: date,
          paymentTime: time,
          dateOfNotice: noticeDate);
      await RTDBService.storePostInfo(info, firm.id.toString());
    } else {
      Info info = Info(
          id: test.last.id + 1,
          name: firm.name!,
          type: type,
          pay: false,
          quantity: int.parse(quantity),
          paymentType: HelperMedhod.chooseType(typeIndex),
          paymentDate: date,
          paymentTime: time,
          dateOfNotice: noticeDate);
      await RTDBService.storePostInfo(info, firm.id.toString());
    }
    emit(StoreInfoSucces());
  }

  void chooseType(int index) {
    typeIndex = index;
    emit(StoreInfoInit());
  }

  Future<Null> refresh(String name) async {
    init(name);
  }

  selectNoticeDate(context) async {
    DateTime? date = await showRoundedDatePicker(
      height: 350,
      context: context,
      background: Colors.white,
      theme: ThemeData.dark(),
    );
    noticeDate = date != null ? HelperMedhod.formatDate(date) : "";
    emit(StoreInfoInit());
  }
}
