import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/display_controller/display_controller.dart';

/// Circular themed button
class ThemedButton extends StatelessWidget {

  final Widget child;
  final bool checked;
  ThemedButton({super.key,  required this.child, this.checked = false});
  final DisplayController displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Material(
        elevation: 5,
        shape: const CircleBorder(),
        color: checked ? displayController.state.appSwatch.value.primary : null,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: child
        ),
      ),
    );
  }
}
