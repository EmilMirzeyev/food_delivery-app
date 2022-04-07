import 'dart:convert';
import '/app/services/abstraction/i_app_settings_service.dart';

import '/app/di/app_di_container.dart';
import '/data/models/app_settings_model.dart';

class AppSettingsService implements IAppSettingsService {
  @override
  Future<AppSettingsModel?> get() async {
    final _appSettingRepository = AppDiContainer.instance.unitOfWork.appSettingsRepository;
    final _settingJson = await _appSettingRepository.get();
    if (_settingJson == null) return null;
    final _settingsMap = json.decode(_settingJson) as Map<String, dynamic>;
    AppSettingsModel _settings = AppSettingsModel();
    _settings.language = _settingsMap['language'];

    return _settings;
  }

  @override
  Future<bool> remove() async {
    final _appSettingRepository = AppDiContainer.instance.unitOfWork.appSettingsRepository;
    final _successfullyRemoved = await _appSettingRepository.remove();
    return _successfullyRemoved;
  }

  @override
  Future<bool> save(AppSettingsModel settings) async {
    final _appSettingRepository = AppDiContainer.instance.unitOfWork.appSettingsRepository;
    final _settingsJson = settings.toJson();
    final _successfullySaved = await _appSettingRepository.save(_settingsJson);
    return _successfullySaved;
  }

  @override
  Future<bool> update(AppSettingsModel settings) async {
    final _appSettingRepository = AppDiContainer.instance.unitOfWork.appSettingsRepository;
    final _settingsJson = settings.toJson();
    final _successfullyUpdated = await _appSettingRepository.update(_settingsJson);
    return _successfullyUpdated;
  }
}
