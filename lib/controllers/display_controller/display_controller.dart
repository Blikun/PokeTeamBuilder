import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

part 'display_state.dart';

class DisplayController extends GetxController {
  final DisplayState state;
  DisplayController(this.state);
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollListener();
    super.onInit();
  }

  void scrollListener() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
          scrollController.position.pixels &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        //paginateLibrary();
      }
    });
  }

  void changeSwatch(MaterialColor color){
    state.appSwatch.value = color;
    update();
  }
  
}
