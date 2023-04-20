import 'package:avitus/infrasurtucture/models/districts.dart';
import 'package:avitus/infrasurtucture/models/provins.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownProvins extends StatelessWidget {
  const DropDownProvins(
      {super.key,
      required this.items,
      required this.selected,
      required this.onChanged,
      required this.label,
      required this.hint,
      required this.enebled});

  final List<Provins> items;
  final Provins? selected;
  final Function onChanged;
  final String label;
  final String hint;
  final bool enebled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenSize.h10),
      child: DropdownSearch<Provins>(
        mode: Mode.MENU,
        items: items,
        enabled: enebled,
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 17.w),
          hintText: hint,
          labelText: label,
          labelStyle: AppTheme.data.textTheme.subtitle2,
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
        selectedItem: selected,
        itemAsString: (Provins? value) {
          return value!.name.toString();
        },
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}

class DropDownDistricts extends StatelessWidget {
  const DropDownDistricts(
      {super.key,
      required this.items,
      required this.selected,
      required this.onChanged,
      required this.label,
      required this.hint,
      required this.enebled});

  final List<Districts> items;
  final Districts? selected;
  final Function onChanged;
  final String label;
  final String hint;
  final bool enebled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenSize.h10),
      child: DropdownSearch<Districts>(
        mode: Mode.MENU,
        items: items,
        enabled: enebled,
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 17.w),
          hintText: hint,
          labelText: label,
          labelStyle: AppTheme.data.textTheme.subtitle2,
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
        selectedItem: selected,
        itemAsString: (Districts? value) {
          return value!.name.toString();
        },
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}
