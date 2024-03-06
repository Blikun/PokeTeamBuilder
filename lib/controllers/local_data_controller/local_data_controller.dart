import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/index_model.dart';

/// Controller for local data management use-cases
class LocalDataController extends GetxController {
  final box = GetStorage();

  void saveTeamData(IndexModel teamData) {
    final dataToStore = teamData.toJsonPrefs();
    box.write('ownedPokemons', dataToStore);
  }

  IndexModel? loadTeamData() {
    final storedData = box.read('ownedPokemons');
    if (storedData != null) {
      IndexModel ownedPokemonBackup = IndexModel.fromJsonPrefs(storedData);
      log("Got ${ownedPokemonBackup.dexIndex?.length} from device");
      return ownedPokemonBackup;
    }
    return null;
  }
}