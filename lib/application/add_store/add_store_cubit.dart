import 'package:avitus/application/add_store/add_store_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStoreCubit extends Cubit<AddStoreState> {
  AddStoreCubit() : super(AddStoreInitial());
}
