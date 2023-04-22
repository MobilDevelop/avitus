import 'package:avitus/application/add_store/add_store_index.dart';
import 'package:avitus/application/home/home_index.dart';
import 'package:avitus/application/user/user_cubit.dart';
import 'package:avitus/application/user/user_state.dart';
import 'package:avitus/presentation/pages/users/components/list_widget.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<UserCubit>();
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppTheme.colors.primary,
                title: Text(
                  tr('users.user'),
                  style: AppTheme.data.textTheme.headline4!
                      .copyWith(color: AppTheme.colors.gray),
                ),
              ),
              body: BlocBuilder<UserCubit, UserState>(
                  builder: (_, state) => ListView.builder(
                      itemCount: cubit.users.length,
                      itemBuilder: (context, index) => ListWidget(
                            user: cubit.users[index],
                            userKey: cubit.key,
                            onChaged: (bool value) {
                              cubit.checkUser(cubit.users[index], value);
                            },
                          ))));
        },
      ),
    );
  }
}
