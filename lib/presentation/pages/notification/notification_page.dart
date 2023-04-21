import 'package:avitus/application/home/home_index.dart';
import 'package:avitus/application/notification/notification_cubit.dart';
import 'package:avitus/application/notification/notification_state.dart';
import 'package:avitus/infrasurtucture/notification_service/notification_service.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/pages/notification/components/list_widget.dart';
import 'package:avitus/presentation/pages/store_info/components/store_info_list_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = context.read<NotificationCubit>();
      return BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) => Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: AppTheme.colors.primary,
                  title: Text(tr('notification.eslatma')),
                  actions: [
                    IconButton(
                        onPressed: () {
                          NotificationService()
                              .showNotification(title: "salom", body: "alik");
                        },
                        icon: Icon(Icons.notification_add))
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.w10, vertical: ScreenSize.h10),
                  child: ListView.builder(
                    itemCount: cubit.items.length,
                    itemBuilder: (context, index) => NotificationListWidget(
                      item: cubit.items[index],
                    ),
                  ),
                ),
              ));
    });
  }
}
