import 'package:avitus/application/add_store/add_store_index.dart';
import 'package:avitus/application/notification/notification_state.dart';
import 'package:avitus/infrasurtucture/helper_method/helper_method.dart';
import 'package:avitus/infrasurtucture/models/info.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()) {
    init();
  }

  List<Info> items = [];

  bool loading = true;

  void init() async {
    List<Info> noSort = await RTDBService.loadPosAlltInfo();

    for (Info element in noSort) {
      if (element.type) {
        int residual = HelperMedhod.dateCalculate(element.dateOfNotice);
        if (residual < 7) {
          items.add(element);
        }
      }
    }
    loading = false;
    emit(NotificationInitial());
  }
}
