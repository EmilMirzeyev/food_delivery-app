abstract class IAppSettingsRepository{
  Future<dynamic> get();
  Future<bool> save(dynamic settings);
  Future<bool> update(dynamic settings);
  Future<bool> remove();
}