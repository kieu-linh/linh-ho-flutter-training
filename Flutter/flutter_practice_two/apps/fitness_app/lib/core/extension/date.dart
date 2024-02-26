import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';

class GetStringDay {
  static String getTitle() {
    final time = DateTime.now();

    /// Set up time now: 5h -> 11h: morning
    if (time.hour >= 5 && time.hour < 11) {
      return FAUiS.current.morning;
    } else if (time.hour >= 11 && time.hour <= 17) {
      // 11h -> 17h: afternoon
      return FAUiS.current.afternoon;
    } else {
      // else: evening
      return FAUiS.current.evening;
    }
  }
}
