import '/data/dtos/restaurant_dto.dart';
import '/data/models/food_model.dart';
import '/data/models/base_model.dart';

class RestaurantModel extends BaseModel {
  final String title;
  final String description;
  final String location;
  final String imageUrl;
  final WorkingTimes workingTimes;
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
    required this.workingTimes,
    required this.rating,
    required this.foods,
    this.isFavorite = false,
    this.inBasket = false,
    this.quantity = 0,
  }) : super(id: id);
}
