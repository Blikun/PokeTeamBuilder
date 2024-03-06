import 'package:flutter/material.dart';

import '../../constants.dart';

/// Pokemon biological info widget
class PokemonBio extends StatelessWidget {
  final int? weight;
  final int? height;
  const PokemonBio({super.key, required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weight == null ? "-" : "Weight: $weight",
          style:
          Constants.indexStyle.copyWith(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          height == null ? "-" : "Height: $height",
          style:
          Constants.indexStyle.copyWith(color: Colors.black, fontSize: 20),
        )
      ],
    );
  }
}