import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';

/// themed snackbar
themedSnackbar ({required String title, required String msg}){
  DisplayController displayController = Get.find<DisplayController>();
  return Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM, maxWidth: 400,duration: 3.seconds,
    backgroundColor: displayController.state.appSwatch.value.primary.withOpacity(0.8)
  );
}