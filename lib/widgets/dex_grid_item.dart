import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:poke_team_builder/models/index_model.dart';

import '../constants.dart';

class DexGridItem extends StatelessWidget {
  final DexEntry dexEntry;

  const DexGridItem({super.key, required this.dexEntry});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 10,strokeAlign: BorderSide.strokeAlignCenter),
                  borderRadius: BorderRadius.circular(90),
                  image: buildDecorationImage(dexEntry),
                ),
              ),
            ),
            Image.network(
              dexEntry.frontDefault ?? "",
              fit: BoxFit.cover,
            ),
          ],
        ),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(dexEntry.name?.toUpperCase() ?? "",
                  style: Constants.indexStyle.copyWith(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 13
                      ..color = Colors.black,
                  ),
                  maxLines: 1),
            )),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(dexEntry.name?.toUpperCase() ?? "",
                  style: Constants.indexStyle, maxLines: 1),
            )),

      ],
    );
  }

  DecorationImage buildDecorationImage(
    DexEntry dexEntry,
  ) {
    return DecorationImage(image: AssetImage(Constants.typeBackgrounds.entries
        .firstWhere((element) => element.key == dexEntry.types![0])
        .value, ),fit: BoxFit.fill);

  }
}
