import 'package:avitus/presentation/assets/res/screen_size.dart';
import 'package:avitus/presentation/assets/theme/app_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerLoading());

  Future<void> init() async {
    emit(AppManagerLoading());
    try {
      await AppTheme.init();
      await ScreenSize.setSizes();

      emit(AppManagerInitial());
    } catch (e) {
      emit(AppManagerError(e.toString()));
    }
  }
}
