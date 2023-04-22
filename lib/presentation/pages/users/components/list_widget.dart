import 'package:avitus/application/add_store/add_store_index.dart';
import 'package:avitus/infrasurtucture/models/user.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.user,
    required this.onChaged,
    required this.userKey,
  }) : super(key: key);
  final User user;
  final Function onChaged;
  final String userKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: ScreenSize.w10),
      margin: EdgeInsets.symmetric(
          vertical: ScreenSize.h6, horizontal: ScreenSize.w10),
      decoration: BoxDecoration(
          color: userKey == user.keyPass
              ? AppTheme.colors.primary.withOpacity(0.3)
              : Colors.white,
          border: Border.all(color: AppTheme.colors.primary, width: 2),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            user.keyPass,
            style: AppTheme.data.textTheme.headline1,
          ),
          Switch(
            value: user.type,
            onChanged: (value) {
              onChaged(value);
            },
            inactiveThumbColor:
                user.type ? AppTheme.colors.primary : Colors.grey,
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
