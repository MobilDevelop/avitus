// ignore_for_file: unused_field

import 'home_index.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    init();
  }
  final searchController = TextEditingController();

  bool searchShow = false;
  final fb = FirebaseDatabase.instance;
  List<Firm> firms = [];
  List<Firm> searchFirms = [];

  init() async {
    firms = await RTDBService.loadPostFirm();
    searchFirms = firms;
    searchFirms.sort(
      (a, b) => a.id.compareTo(b.id),
    );
    emit(HomeInitial());
  }

  Future<Null> refresh() async {
    init();
  }

  void searchFirm() {
    searchFirms.clear();
    String searchText = searchController.text.trim();
    for (Firm item in firms) {
      if (item.name!.length >= searchText.length) {
        if (item.name!.substring(0, searchText.length) == searchText) {
          searchFirms.add(item);
        }
      }
    }
    emit(HomeInitial());
  }

  void showSearch() {
    searchShow = !searchShow;
    if (!searchShow) {
      searchController.clear();
      searchFirm();
    } else {
      emit(HomeInitial());
    }
  }
}
