import '/data/models/app_settings_model.dart';

abstract class IAppSettingsService{
  Future<AppSettingsModel?> get();
  Future<bool> save(AppSettingsModel settings);
  Future<bool> update(AppSettingsModel settings);
  Future<bool> remove();
}