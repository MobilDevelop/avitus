import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.chooseType,
    required this.labelText,
    required this.hinText,
    required this.enebled,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool chooseType;
  final String labelText;
  final String hinText;
  final bool enebled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.symmetric(vertical: ScreenSize.h10),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: enebled,
        keyboardType: chooseType ? TextInputType.number : TextInputType.number,
        inputFormatters: [
          MaskTextInputFormatter(
              mask: '####################',
              filter: {"#": RegExp(r'[0-9]')},
              type: MaskAutoCompletionType.lazy)
        ],
        decoration: InputDecoration(
          label: Text(
            labelText,
            style: AppTheme.data.textTheme.subtitle2,
          ),
          hintText: hinText,
          hintStyle: AppTheme.data.textTheme.bodyText2,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  BorderSide(width: 1.5, color: AppTheme.colors.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  BorderSide(width: 1.5, color: AppTheme.colors.primary)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  BorderSide(width: 1.5, color: AppTheme.colors.primary)),
        ),
      ),
    );
  }
}
