import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/navigation_controller/navigation_controller.dart';

import '../assets.dart';
import '../constants.dart';

/// Navigation button for owned screen
class SeeCapturedButton extends StatelessWidget {
  SeeCapturedButton({super.key});
  final NavigationController navigationController = Get.find<NavigationController>();
  final DisplayController displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        navigationController.showOwnedScreen();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
          side: BorderSide(color: displayController.state.appSwatch.value.primary, width: 5,strokeAlign: 1),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            Image.asset(Assets.substitute, width: 25, height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Your Pokemon",
                style: Constants.indexStyle.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
