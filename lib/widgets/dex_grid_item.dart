import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../assets.dart';
import '../constants.dart';
import '../models/dex_entry_model.dart';

/// Grid item [onTap] returns a [DexEntry]
class DexGridItem extends StatelessWidget {
  final DexEntry dexEntry;
  final Function(DexEntry) onTap;
  final Function(DexEntry) onDelete;
  final bool isRemovable;

  const DexGridItem(
      {super.key,
      required this.dexEntry,
      required this.onTap,
      required this.onDelete,
      this.isRemovable = false});

  DecorationImage _buildDecorationImage(
    DexEntry dexEntry,
  ) {
    return DecorationImage(
        image: AssetImage(
          Constants.typeBackgrounds.entries
              .firstWhere((element) => element.key == dexEntry.types![0])
              .value,
        ),
        fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onTap: () {
            onTap(dexEntry);
          },
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Constants.typeColors.entries
                            .firstWhere((element) =>
                                element.key == dexEntry.types?.first)
                            .value
                            .withOpacity(0.40),
                        blurRadius: 15,
                        spreadRadius: 10,
                      )
                    ],
                    border: Border.all(
                        color: Colors.black,
                        width: 8,
                        strokeAlign: BorderSide.strokeAlignCenter),
                    image: _buildDecorationImage(dexEntry),
                  ),
                ),
              ),
              Image.network(
                dexEntry.frontDefault ?? "",
                fit: BoxFit.cover,
                errorBuilder:
                    (BuildContext context, Object obj, StackTrace? err) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Assets.substitute),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Lottie.asset(Assets.pokeballAnim),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        if (isRemovable)
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                onDelete(dexEntry);
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                height: 30,
                width: 30,
                child: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
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
}
