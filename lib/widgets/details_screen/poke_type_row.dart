import 'package:flutter/material.dart';
import '../../constants.dart';

class PokeTypeRow extends StatelessWidget {
  final List<PokeType> types;

  const PokeTypeRow({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types
          .map((type) => SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(Constants.typeIcons[type] ?? ''),
      ))
          .toList(),
    );
  }
}