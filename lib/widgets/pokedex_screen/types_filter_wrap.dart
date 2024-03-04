import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../constants.dart';
import '../../controllers/search_controller/search_controller.dart';
import '../../models/search_model.dart';

class TypesFilterWrap extends StatelessWidget {
  final double size;

  TypesFilterWrap({super.key, required this.size});

  final FilterSearchController searchController =
      Get.find<FilterSearchController>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        for (var element in Constants.typeIcons.entries) ...{
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: Material(
              elevation: 5,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Ink.image(
                  height: size,
                  width: size,
                  image: AssetImage(element.value),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {
                      searchController.changeSearchParameters(
                          SearchModel(pokeTypeMain: element.key));
                    },
                  ),
                ),
              ),
            ),
          )
        }
      ],
    );
  }
}
