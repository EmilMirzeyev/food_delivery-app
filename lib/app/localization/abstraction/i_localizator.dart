import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class ILocalizator {
  @protected
  late Map<String, dynamic> translations;

  @protected //for ignore localization crashing when testing
  late Map<String, dynamic> azTranslations;

  Future<void> loadResource(String lang) async {
    String _data = '';
    _data = await rootBundle.loadString('assets/localization/$lang.json');
    translations = jsonDecode(_data);

    //for ignore localization crashing when testing
    String _azData = await rootBundle.loadString('assets/localization/az.json');
    azTranslations = jsonDecode(_azData);
  }

  Future<void> initialize({required String lang});
  String getWord({required String key}) {
    try {
      return translations[key]!;
    } catch (e) {
      return azTranslations[key]!;
    }
  }
}
