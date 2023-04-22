import 'dart:math';
import 'package:avitus/application/secret/secret_page_state.dart';
import 'package:avitus/infrasurtucture/firebase_service/firebase_service.dart';
import 'package:avitus/infrasurtucture/local_source/local_source.dart';
import 'package:avitus/infrasurtucture/models/user.dart';
import 'package:bloc/bloc.dart';

class SecretPageCubit extends Cubit<SecretPageState> {
  SecretPageCubit() : super(SecretPageInitial()) {
    init();
  }
  String key = '';
  bool loadingView = true;
  bool nextPage = false;
  bool clearKey = true;
  Random random = Random();
  List<User> users = [];

  init() async {
    key = await LocalSource.getDeviceId();
    if (key.isEmpty) {
      clearKey = false;
      int newKey = 100000 + random.nextInt(899999);

      LocalSource.setDeviceId(newKey.toString());
      key = newKey.toString();
      User user = User(type: false, key: '', keyPass: newKey.toString());
      RTDBService.storePostUser(user);
    } else {
      users = await RTDBService.loadPostUser();
      for (User item in users) {
        if (key == item.keyPass) {
          clearKey = false;
          nextPage = item.type;
          break;
        }
      }
    }
    if (clearKey) {
      await LocalSource.clearProfile();
    }
    if (nextPage) {
      emit(NextHomePage());
    } else {
      loadingView = false;
      emit(SecretPageInitial());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
