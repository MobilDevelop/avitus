import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearch({
    super.key,
    required this.controller,
    required this.ontapClear,
    required this.ontapBack,
    required this.onChaged,
  });
  final TextEditingController controller;
  final VoidCallback ontapClear;
  final VoidCallback ontapBack;
  final Function onChaged;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 55,
      backgroundColor: AppTheme.colors.primary,
      title: Container(
        decoration: BoxDecoration(
            color: AppTheme.colors.background,
            borderRadius: BorderRadius.circular(10.r)),
        width: double.infinity,
        height: 45,
        child: TextField(
          controller: controller,
          onChanged: (value) => onChaged(value),
          autofocus: true,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: () => ontapBack(),
                  icon: SvgPicture.asset(
                    AppIcons.left,
                    color: AppTheme.colors.black,
                  )),
              contentPadding: const EdgeInsets.only(top: 15),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppTheme.colors.primary)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppTheme.colors.primary)),
              hintText: tr('home.search_text'),
              hintStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
