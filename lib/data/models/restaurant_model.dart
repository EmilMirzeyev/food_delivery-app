import 'package:food_delivery_app/data/dtos/food_dto.dart';
import 'package:food_delivery_app/data/models/food_model.dart';

import '../dtos/restaurant_dto.dart';
import '/data/models/base_model.dart';

class RestaurantModel extends BaseModel {
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final Rating rating;
  final List<FoodModel> foods;
  bool isFavorite;
  bool inBasket;
  int quantity;

  RestaurantModel({
    required dynamic id,
    required this.title,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.foods,
    this.isFavorite = false,
    this.inBasket = false,
    this.quantity = 0,
  }) : super(id: id);
}
