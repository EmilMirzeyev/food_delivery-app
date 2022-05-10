import 'package:food_delivery_app/data/migrator/food_migrator.dart';

import '../dtos/restaurant_dto.dart';
import '/data/migrator/migrator.dart';
import '../models/restaurant_model.dart';

class RestaurantMigrator implements Migrator<RestaurantModel, RestaurantDto> {
  @override
  RestaurantDto migrateToDto(RestaurantModel model) {
    return RestaurantDto(
      id: model.id,
      title: model.title,
      location: model.location,
      description: model.description,
      imageUrl: model.imageUrl,
      workingTimes: model.workingTimes,
      rating: model.rating,
      foods: model.foods.map((e) => FoodMigrator().migrateToDto(e)).toList(),
    );
  }

  @override
  RestaurantModel migrateToModel(RestaurantDto dto) {
    return RestaurantModel(
      id: dto.id,
      title: dto.title,
      location: dto.location,
      description: dto.description,
      imageUrl: dto.imageUrl,
      workingTimes: dto.workingTimes,
      rating: dto.rating,
      foods: dto.foods.map((e) => FoodMigrator().migrateToModel(e)).toList(),
    );
  }
}
