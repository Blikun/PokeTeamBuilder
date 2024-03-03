import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assets.dart';

class Constants {
  //styles
  static final TextStyle indexStyle = GoogleFonts.orbitron(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w900,
    height: 0,
    letterSpacing: 0,
    wordSpacing: 0,
  );

  static const Map<PokeType, Color> typeColors = {
    PokeType.normal: Color.fromRGBO(167, 167, 120, 1.0),
    PokeType.grass: Color.fromRGBO(119, 198, 80, 1.0),
    PokeType.fire: Color.fromRGBO(238, 127, 49, 1.0),
    PokeType.water: Color.fromRGBO(103, 143, 239, 1.0),
    PokeType.electric: Color.fromRGBO(246, 206, 49, 1.0),
    PokeType.rock: Color.fromRGBO(183, 159, 57, 1.0),
    PokeType.fighting: Color.fromRGBO(190, 48, 41, 1.0),
    PokeType.psychic: Color.fromRGBO(246, 87, 136, 1.0),
    PokeType.ghost: Color.fromRGBO(111, 87, 152, 1.0),
    PokeType.poison: Color.fromRGBO(159, 63, 160, 1.0),
    PokeType.flying: Color.fromRGBO(167, 143, 239, 1.0),
    PokeType.ground: Color.fromRGBO(222, 190, 104, 1.0),
    PokeType.dragon: Color.fromRGBO(111, 56, 247, 1.0),
    PokeType.ice: Color.fromRGBO(151, 214, 215, 1.0),
    PokeType.bug: Color.fromRGBO(167, 183, 33, 1.0),
    PokeType.steel: Color.fromRGBO(183, 183, 207, 1.0),
    PokeType.dark: Color.fromRGBO(111, 87, 72, 1.0),
    PokeType.fairy: Color.fromRGBO(253, 100, 212, 1.0),
  };

  static const Map<PokeType, String> typeBackgrounds = {
    PokeType.fire: Assets.fireBg,
    PokeType.bug: Assets.bugBg,
    PokeType.dark: Assets.darkBg,
    PokeType.dragon: Assets.dragonBg,
    PokeType.electric: Assets.electricBg,
    PokeType.fairy: Assets.fairyBg,
    PokeType.fighting: Assets.fightBg,
    PokeType.flying: Assets.flyingBg,
    PokeType.ghost: Assets.ghostBg,
    PokeType.grass: Assets.grassBg,
    PokeType.ground: Assets.groundBg,
    PokeType.ice: Assets.iceBg,
    PokeType.normal: Assets.normalBg,
    PokeType.poison: Assets.poisonBg,
    PokeType.psychic: Assets.psychicBg,
    PokeType.rock: Assets.rockBg,
    PokeType.steel: Assets.steelBg,
    PokeType.water: Assets.waterBg,
  };

  static const Map<PokeType, String> typeIcons = {
    PokeType.fire: Assets.iconFire,
    PokeType.bug: Assets.iconBug,
    PokeType.dark: Assets.iconDark,
    PokeType.dragon: Assets.iconDragon,
    PokeType.electric: Assets.iconElectric,
    PokeType.fairy: Assets.iconFairy,
    PokeType.fighting: Assets.iconFight,
    PokeType.flying: Assets.iconFlying,
    PokeType.ghost: Assets.iconGhost,
    PokeType.grass: Assets.iconGrass,
    PokeType.ground: Assets.iconGround,
    PokeType.ice: Assets.iconIce,
    PokeType.normal: Assets.iconNormal,
    PokeType.poison: Assets.iconPoison,
    PokeType.psychic: Assets.iconPsychic,
    PokeType.rock: Assets.iconRock,
    PokeType.steel: Assets.iconSteel,
    PokeType.water: Assets.iconWater,
  };

}

enum PokeType {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy
}
