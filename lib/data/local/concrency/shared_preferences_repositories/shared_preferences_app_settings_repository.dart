import 'package:shared_preferences/shared_preferences.dart';
import '/data/local/abstraction/i_app_settings_repository.dart';

class SharedPreferencesAppSettingsRepository implements IAppSettingsRepository {
  final Future<SharedPreferences> preferencesIsBeingCreated;
  SharedPreferencesAppSettingsRepository(this.preferencesIsBeingCreated);
  @override
  Future get() async {
    final _prefs = await preferencesIsBeingCreated;
    final _token = _prefs.getString(runtimeType.toString());
    return _token;
  }

  @override
  Future<bool> remove() async {
    final _prefs = await preferencesIsBeingCreated;
    final _successfullyRemoved = await _prefs.remove(runtimeType.toString());
    return _successfullyRemoved;
  }

  @override
  Future<bool> save(dynamic settings) async {
    final _settingsJson = await get();
    if (_settingsJson == settings) return true;
    final _prefs = await preferencesIsBeingCreated;
    final _successfullySaved =
        await _prefs.setString(runtimeType.toString(), settings ?? 'settings');
    return _successfullySaved;
  }

  @override
  Future<bool> update(dynamic settings) async {
    final _settingsJson = await get();
    if (_settingsJson == settings) return true;
    final _prefs = await preferencesIsBeingCreated;
    final _successfullyUpdated =
        await _prefs.setString(runtimeType.toString(), settings ?? 'settings');
    return _successfullyUpdated;
  }
}
