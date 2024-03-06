part of "display_controller.dart";

/// Display and Theme state
class DisplayState {
  Rx<ColorScheme> appSwatch =
      Rx<ColorScheme>(ColorScheme.fromSwatch(primarySwatch: Colors.red));
}
