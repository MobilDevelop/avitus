import 'package:avitus/application/add_store/add_store_index.dart';
import 'package:avitus/application/user/user_state.dart';
import 'package:avitus/infrasurtucture/local_source/local_source.dart';
import 'package:avitus/infrasurtucture/models/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
    init();
  }
  List<User> users = [];
  String key = '';

  void init() async {
    users = await RTDBService.loadPostUser();
    key = await LocalSource.getDeviceId();
    emit(UserInitial());
  }

  checkUser(User user, bool type) async {
    User updateUser = User(type: type, key: user.key, keyPass: user.keyPass);
    await RTDBService.storePutUse(updateUser);
    init();
  }
}
