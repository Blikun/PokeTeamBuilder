import 'dart:io';
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

  bool isMobile() {
    bool isMobile = false;
      if (Platform.isIOS || Platform.isAndroid) {
       isMobile = true;
      }
      return isMobile;
    }

}

