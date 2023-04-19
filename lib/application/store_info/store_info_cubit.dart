import 'package:avitus/application/home/home_index.dart';
import 'package:avitus/application/store_info/store_info_state.dart';
import 'package:avitus/infrasurtucture/helper_method/helper_method.dart';
import 'package:avitus/infrasurtucture/models/info.dart';

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

  void init(String name) async {
    if (name.isNotEmpty) {
      items = await RTDBService.loadPostInfo(name);
      for (Info item in items) {
        allSumm += item.quantity;
      }
      emit(StoreInfoInit());
    }
  }

  void addInfo(bool type) async {
    String date = HelperMedhod.formatDate();
    String time = HelperMedhod.formatTime();

    Info info = Info(
        id: 0,
        type: type,
        quantity: 0,
        paymentType: "paymentType",
        paymentDate: date,
        paymentTime: time,
        dateOfNotice: "dateOfNotice");
  }

  void chooseType(int index) {
    typeIndex = index;
    emit(StoreInfoInit());
  }
}
