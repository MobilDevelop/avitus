import 'package:avitus/application/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final searchController = TextEditingController();

  bool searchShow = false;

  void showSearch() {
    searchShow = !searchShow;
    emit(HomeInitial());
  }
}
