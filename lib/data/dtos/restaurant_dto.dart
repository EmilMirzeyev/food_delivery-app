import 'package:food_delivery_app/data/dtos/food_dto.dart';
import 'package:food_delivery_app/data/network/concrency/restaurants_network_manager.dart';

class BaseDto {
  late dynamic id;
  BaseDto({this.id});
}

class WorkingTimes {
  static final year = DateTime.now().year;
  static final month = DateTime.now().month;
  static final day = DateTime.now().day;
  final DateTime opening;
  final DateTime closing;

  WorkingTimes({
    required this.opening,
    required this.closing,
  });
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });
}

class RestaurantDto extends BaseDto {
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final WorkingTimes workingTimes;
  final Rating rating;
  final List<FoodDto> foods;
  final List<AddInfo>? additionalInfo;

  RestaurantDto({
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.workingTimes,
    required this.rating,
    required this.foods,
    this.additionalInfo,
    dynamic id,
  }) : super(id: id);
}
