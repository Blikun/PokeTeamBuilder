import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_team_builder/models/index_model.dart';

import '../assets.dart';
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
              errorBuilder: (BuildContext context, Object obj, StackTrace? err){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Assets.substitute),
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Lottie.asset(Assets.pokeballAnim),
                ),);
              },
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
