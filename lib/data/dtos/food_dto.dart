import 'package:food_delivery_app/data/dtos/restaurant_dto.dart';

class FoodDto extends BaseDto {
  final String title;
  final String recipe;
  final dynamic price;
  final String imageUrl;
  final String category;
  final Rating rating;

  FoodDto({
    required this.title,
    required this.recipe,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
    dynamic id
  }) : super(id: id);
}
