import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/navigation_controller/navigation_controller.dart';

import '../assets.dart';

class CapturedButton extends StatelessWidget {
  CapturedButton({super.key});
  final NavigationController navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: () async {
          navigationController.showOwnedScreen();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5), // Adjust padding as needed
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown, // Ensures text scales down to fit the button
          child: Row(
            children: [
              Image.asset(Assets.substitute, width: 25, height: 25,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Your pokemon",
                  style: TextStyle(fontSize: 18), // Adjust font size as needed
                ),
              ),
            ],
          ),
        ),
      );

  }
}
