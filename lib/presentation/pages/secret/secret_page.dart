import 'package:avitus/application/secret/secret_page_cubit.dart';
import 'package:avitus/application/secret/secret_page_state.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/routes/entity/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SecretPageCubit(),
      child: BlocListener<SecretPageCubit, SecretPageState>(
        listener: (context, state) {
          if (state is NextHomePage) {
            context.pushReplacement(Routes.home.path);
          }
        },
        child: Builder(builder: (context) {
          final cubit = context.read<SecretPageCubit>();
          return BlocBuilder<SecretPageCubit, SecretPageState>(
            builder: (context, state) {
              if (cubit.loadingView) {
                return Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: ScreenSize.h32),
                  color: AppTheme.colors.primary,
                  child: Text("A V I T U S",
                      style: AppTheme.data.textTheme.headline1!
                          .copyWith(color: Colors.white)),
                );
              }
              return Scaffold(
                body: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: AppTheme.colors.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.h,
                        width: 200.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: AppTheme.colors.primary, width: 2),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(cubit.key,
                            style: AppTheme.data.textTheme.headline1!
                                .copyWith(fontSize: 30.sp)),
                      ),
                      Gap(40.h),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: ScreenSize.w20),
                        child: Text(tr('secret.secret_error'),
                            textAlign: TextAlign.center,
                            style: AppTheme.data.textTheme.headline1),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
