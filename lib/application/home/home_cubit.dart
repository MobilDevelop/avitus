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
