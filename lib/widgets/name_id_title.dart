import 'package:flutter/material.dart';

import '../constants.dart';


class NameIdTitle extends StatelessWidget {
  final String name;
  final int id;

  const NameIdTitle({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(children: [
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("#$id  ${name.toUpperCase()}",
                  style: Constants.indexStyle.copyWith(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 18.5
                      ..color = Colors.black,
                  ),
                  maxLines: 1),
            )),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "#$id  ${name.toUpperCase()}",
                style: Constants.indexStyle.copyWith(fontSize: 30),
              ),
            )),
      ]),
    );
  }
}