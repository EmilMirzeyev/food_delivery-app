import 'package:food_delivery_app/data/dtos/restaurant_dto.dart';
import 'package:food_delivery_app/data/models/base_model.dart';

class FoodModel extends BaseModel {
  final String title;
  final String recipe;
  final dynamic price;
  final String imageUrl;
  final String category;
  final bool isPopular;
  final Rating rating;

  FoodModel({
    required dynamic id,
    required this.title,
    required this.recipe,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.isPopular,
    required this.rating,
  }) : super(id: id);
}
