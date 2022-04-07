import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '/data/local/abstraction/i_local_auth_repository.dart';

class SharedPreferencesLocalAuthRepository extends ILocalAuthRepository {
  final Future<SharedPreferences> preferencesIsBeingCreated;
  SharedPreferencesLocalAuthRepository(this.preferencesIsBeingCreated);

  @override
  Future<List<int>?> get() async {
    final _prefs = await preferencesIsBeingCreated;
    final _favoritesJson = _prefs.getString(runtimeType.toString());
    final _favorites = (json.decode(_favoritesJson ?? '[]'));

    return List.from(_favorites);
  }

  @override
  Future<bool> remove() async {
    final _prefs = await preferencesIsBeingCreated;
    final _successfullyRemoved = await _prefs.remove(runtimeType.toString());
    return _successfullyRemoved;
  }

  @override
  Future<bool> save({required List<int>? pincode}) async {
    final _prefs = await preferencesIsBeingCreated;
    final _successfullySaved =
        await _prefs.setString(runtimeType.toString(), jsonEncode(pincode));
    return _successfullySaved;
  }

  @override
  Future<bool> update({required List<int>? pincode}) async {
    final _prefs = await preferencesIsBeingCreated;
    final _successfullyUpdated =
        await _prefs.setString(runtimeType.toString(), jsonEncode(pincode));
    return _successfullyUpdated;
  }
}
