import 'dart:convert';

class AppSettingsModel {
  late String? language;
  AppSettingsModel({this.language});
  Map _toMap() {
    return {
      'language': language,
    };
  }

  String toJson() {
    return json.encode(_toMap());
  }
}