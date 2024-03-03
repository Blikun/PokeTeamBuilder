part of "display_controller.dart";

class DisplayState {
  Rx<ColorScheme> appSwatch =
      Rx<ColorScheme>(ColorScheme.fromSwatch(primarySwatch: Colors.red));
}
