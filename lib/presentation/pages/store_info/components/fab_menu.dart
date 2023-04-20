import 'dart:math';

import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:avitus/presentation/assets/theme/app_theme.dart';
import 'package:avitus/presentation/pages/store_info/components/bottom_sheet_store.dart';
import 'package:avitus/presentation/routes/entity/routes.dart';
import 'package:avitus/presentation/routes/index_routes.dart';
import 'package:flutter/material.dart';

const double buttonSize = 60;

class FabMenu extends StatefulWidget {
  const FabMenu({super.key, required this.idName, required this.firm});
  final String idName;
  final Firm firm;
  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: <IconData>[
        Icons.info,
        Icons.remove,
        Icons.add,
        Icons.menu,
      ].map<Widget>(buildFab).toList());

  Widget buildFab(IconData icon) => SizedBox(
        height: buttonSize,
        width: buttonSize,
        child: FloatingActionButton(
            elevation: 0,
            heroTag: icon,
            backgroundColor: AppTheme.colors.primary,
            splashColor: AppTheme.colors.black,
            child: Icon(
              icon,
              color: AppTheme.colors.secondary,
              size: 35,
            ),
            onPressed: () {
              if (controller.status == AnimationStatus.completed) {
                controller.reverse();
                print(icon.codePoint);
                if (icon.codePoint == 58646) {
                  BottomShetStore.bottomSheetRemove(context, widget.idName);
                } else if (icon.codePoint == 57415) {
                  BottomShetStore.bottomSheetAdd(context, widget.idName);
                } else {
                  context.push(Routes.addStore.path, extra: widget.firm);
                }
              } else {
                controller.forward();
              }
            }),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;

      final radius = 130 * controller.value;

      final theta = i * pi * 0.5 / (n - 2);
      final x = xStart - setValue(radius * cos(theta));
      final y = yStart - setValue(radius * sin(theta));
      context.paintChild(i,
          transform: Matrix4.identity()
            ..translate(x, y, 0)
            ..translate(buttonSize / 2, buttonSize / 2)
            ..rotateZ(
                isLastItem ? 0.0 : 180 * (1 - controller.value) * pi / 180)
            ..scale(isLastItem ? 1.0 : max(controller.value, 0.5))
            ..translate(-buttonSize / 2, -buttonSize / 2));
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => false;
}
