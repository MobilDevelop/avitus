// ignore_for_file: unused_field

import 'package:avitus/infrasurtucture/helper_method/helper_method.dart';
import 'package:avitus/infrasurtucture/models/info.dart';
import 'package:avitus/infrasurtucture/notification_service/notification_service.dart';

import 'home_index.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    init();
  }
  final searchController = TextEditingController();

  bool searchShow = false;
  bool loading = true;
  final fb = FirebaseDatabase.instance;
  List<Firm> firms = [];
  List<Info> items = [];
  List<Firm> searchFirms = [];

  init() async {
    loading = true;
    emit(HomeInitial());
    List<Info> noSort = await RTDBService.loadPosAlltInfo();
    for (Info element in noSort) {
      if (element.type) {
        int residual = HelperMedhod.dateCalculate(element.dateOfNotice);
        if (residual < 7) {
          items.add(element);
        }
      }
    }
    if (items.isNotEmpty) {
      NotificationService().showNotification(
          id: 12,
          payload: "AVITUS",
          title: "Тўланмаган қарзларингизни муддати етиб келди",
          body: "Илтимос қарздорликни бартараф етинг");
    }

    firms = await RTDBService.loadPostFirm();
    firms.sort(
      (a, b) => a.id.compareTo(b.id),
    );
    firms.reversed.toList();
    searchFirms.clear();
    String searchText = searchController.text.trim();
    for (Firm item in firms) {
      if (item.name!.length >= searchText.length) {
        if (item.name!.substring(0, searchText.length) == searchText) {
          searchFirms.add(item);
        }
      }
    }
    loading = false;
    emit(HomeInitial());
  }

  Future<Null> refresh() async {
    init();
  }

  void showSearch() {
    searchShow = !searchShow;
    if (!searchShow) {
      searchController.clear();
      init();
    } else {
      emit(HomeInitial());
    }
  }
}
