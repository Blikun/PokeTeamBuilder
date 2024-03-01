import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poke_team_builder/constants.dart';

class Utils {

  String pokeTypeToString(PokeType pokeType) {
    String typeName = pokeType.name;
    return typeName;
  }

  PokeType stringToPokeType(String typeStr) {
    PokeType pokeType = PokeType.values.firstWhere(
        (enumElement) => enumElement.name == typeStr,
        orElse: () => throw ArgumentError('Invalid type'));
    return pokeType;
  }

}

class WebDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}