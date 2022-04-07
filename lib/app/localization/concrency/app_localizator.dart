import '/app/localization/abstraction/i_localizator.dart';

class AppLocalizator extends ILocalizator {
  @override
  Future<void> initialize({required String lang}) async {
    await loadResource(lang);
  }
}