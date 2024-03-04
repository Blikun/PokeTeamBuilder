import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/widgets/themed_button.dart';

import '../../constants.dart';
import '../../controllers/search_controller/search_controller.dart';
import '../../models/search_model.dart';

class TypesFilterWrap extends StatelessWidget {
  final double size;

  TypesFilterWrap({super.key, required this.size});

  final FilterSearchController searchController =
      Get.find<FilterSearchController>();
  final DisplayController displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        for (var element in Constants.typeIcons.entries) ...{
          Obx(() {
            return ThemedButton(
              checked:
                  searchController.state.searchParameters.value?.pokeTypeMain ==
                      element.key,
              child: Ink.image(
                height: size,
                width: size,
                image: AssetImage(element.value),
                fit: BoxFit.cover,
                child: InkWell(
                  splashColor: displayController.state.appSwatch.value.primary
                      .withOpacity(0.5),
                  onTap: () {
                    searchController.changeSearchParameters(
                        SearchModel(pokeTypeMain: element.key));
                  },
                ),
              ),
            );
          })
        }
      ],
    );
  }
}
