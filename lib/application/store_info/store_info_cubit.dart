import 'package:avitus/application/home/home_cubit.dart';
import 'package:avitus/application/store_info/store_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreInfoCubit extends Cubit<StoreInfoState> {
  StoreInfoCubit() : super(StoreInfoInit());
}
