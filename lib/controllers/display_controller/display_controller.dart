import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

part 'display_state.dart';

class DisplayController extends GetxController {
  final DisplayState state;
  DisplayController(this.state);
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollListener();
    super.onInit();
  }

  void scrollListener() async {
    state.scrollController.addListener(() {
      if (state.scrollController.position.maxScrollExtent <=
          state.scrollController.position.pixels &&
          state.scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        //paginateLibrary();
      }
    });
  }
  
}
