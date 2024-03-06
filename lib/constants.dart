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

  static const Map<PokeType, MaterialColor> typeColors = {
    PokeType.normal: Colors.grey,
    PokeType.grass: Colors.green,
    PokeType.fire: Colors.orange,
    PokeType.water: Colors.indigo,
    PokeType.electric: Colors.yellow,
    PokeType.rock: Colors.blueGrey,
    PokeType.fighting:Colors.red,
    PokeType.psychic: Colors.purple,
    PokeType.ghost: Colors.deepPurple,
    PokeType.poison: Colors.purple,
    PokeType.flying: Colors.lightBlue,
    PokeType.ground: Colors.brown,
    PokeType.dragon: Colors.blueGrey,
    PokeType.ice: Colors.lightBlue,
    PokeType.bug: Colors.lightGreen,
    PokeType.steel: Colors.grey,
    PokeType.dark: Colors.deepPurple,
    PokeType.fairy: Colors.pink,
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
