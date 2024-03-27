import 'package:fitness_ui/l10n/generated/l10n.dart';

/// extension [DateHelper] to get day session
extension DateHelper on DateTime {
  String getDaySession() {
    final time = this;

    /// Set up time now: 5h -> 11h: morning
    if (time.hour >= 5 && time.hour < 12) {
      return FAUiS.current.morningTitle;
    } else if (time.hour >= 12 && time.hour <= 17) {
      // 11h -> 17h: afternoon
      return FAUiS.current.afternoonTitle;
    } else {
      // else: evening
      return FAUiS.current.eveningTitle;
    }
  }
}
