import 'package:food_delivery_app/data/dtos/food_dto.dart';

class BaseDto {
  late dynamic id;
  BaseDto({this.id});
}

class Rating {
  final dynamic rate;
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
  final Rating rating;
  final List<FoodDto> foods;

  RestaurantDto({
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.foods,
    dynamic id,
  }) : super(id: id);
}
