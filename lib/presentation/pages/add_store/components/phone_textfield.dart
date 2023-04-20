import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneTextFieldView extends StatelessWidget {
  const PhoneTextFieldView({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.enebled,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
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
        keyboardType: TextInputType.number,
        enableInteractiveSelection: false,
        inputFormatters: [
          MaskTextInputFormatter(
              mask: '+99 8##-###-##-##',
              filter: {"#": RegExp(r'[0-9]')},
              type: MaskAutoCompletionType.lazy)
        ],
        decoration: InputDecoration(
          label: Text(
            labelText,
            style: AppTheme.data.textTheme.subtitle2,
          ),
          hintText: '+99 8**-***-**-**',
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
