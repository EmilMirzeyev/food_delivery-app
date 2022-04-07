import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPreferencesAllRemovable {
  final Future<SharedPreferences> preferencesIsBeingCreated;
  ISharedPreferencesAllRemovable(this.preferencesIsBeingCreated);
  Future<bool> removeAll() async {
    final _prefs = await preferencesIsBeingCreated;
    final _successfullyRemoved = await _prefs.remove(runtimeType.toString());
    return _successfullyRemoved;
  }
}
