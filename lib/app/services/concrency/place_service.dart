import 'dart:io';

class Place {
  final String placeId, description;

  Place({required this.placeId, required this.description});

  static Place fromJson(Map<String, dynamic> json) {
    return Place(
      placeId: json['placeId'],
      description: json['description'],
    );
  }
}

class PlaceApi {
  PlaceApi._internal();
  static PlaceApi get instance => PlaceApi._internal();

  static const String androidKey = 'androidddaddadd';
  static const String iosKey = 'ioooooooooooooooossssse';
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  // Future<List<Place>> searchPredictions(String input) async {
  //   try {
  //     final response = await 
  //   } catch (e) {
  //   }
  // }
}
