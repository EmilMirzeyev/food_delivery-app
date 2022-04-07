import 'package:flutter/material.dart';
import '/app/di/app_di_container.dart';
import '/app/services/concrency/app_settings_service.dart';
import '/data/models/app_settings_model.dart';

import 'app/start/food_delivery_app.dart';

late String language = 'az';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _settingsService = AppSettingsService();
  final _settings = await _settingsService.get();
  if (_settings != null) {
    language = _settings.language!;
  } else {

    AppSettingsModel _settings = AppSettingsModel(
      language: 'az',
    );

    _settingsService.save(_settings);
  }

  await AppDiContainer.instance.appLocalizator.initialize(
    lang: language,
  );
  runApp(const FoodDeliveryApp());
}
