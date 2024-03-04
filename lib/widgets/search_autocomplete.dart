import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';

import '../controllers/search_controller/search_controller.dart';

/// Autocomplete text input
class SearchAutocompleteField extends StatelessWidget {
  SearchAutocompleteField({super.key, required this.onTapCallback});

  final Function(String) onTapCallback;

  set textController(TextEditingController controller) {}
  final FilterSearchController searchController =
      Get.find<FilterSearchController>();
  final DisplayController displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        } else {
          return searchController.getSearchOptions(textEditingValue, count: 3);
        }
      },
      onSelected: onTapCallback,
      optionsViewBuilder: (context, Function(String) onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 250, // Example constraint
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: Wrap(
                runSpacing: 5,
                alignment: WrapAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  for (var option in options) ...{
                    _optionTap(option.toString(), onSelected),
                  },
                ],
              ),
            ),
          ),
        );
      },
      fieldViewBuilder:
          (context, textController, focusNode, onEditingComplete) {
        textController = textController;
        return TextField(
          onChanged: onTapCallback,
          controller: textController,
          focusNode: focusNode,
          autocorrect: false,
          clipBehavior: Clip.none,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90.0),
                borderSide: BorderSide(
                    width: 3,
                    color: displayController.state.appSwatch.value.primary
                        .withOpacity(0.4))),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.black12),
              borderRadius: BorderRadius.circular(90.0),
            ),
            filled: true,
            hintText: "Search for pokemon",
            hintStyle: const TextStyle(height: 4.2),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: displayController.state.appSwatch.value.primary,
            ),
          ),
        );
      },
    );
  }

  Widget _optionTap(String option, Function(String) onSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            onSelected(option.toString());
          },
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
              side: BorderSide(
                  width: 3,
                  color: displayController.state.appSwatch.value.primary
                      .withOpacity(0.2)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                option,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
