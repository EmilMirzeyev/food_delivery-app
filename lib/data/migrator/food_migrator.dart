import 'package:food_delivery_app/data/dtos/food_dto.dart';
import 'package:food_delivery_app/data/models/food_model.dart';
import '/data/migrator/migrator.dart';

class FoodMigrator implements Migrator<FoodModel, FoodDto> {
  @override
  FoodDto migrateToDto(FoodModel model) {
    return FoodDto(
      id: model.id,
      title: model.title,
      imageUrl: model.imageUrl,
      rating: model.rating,
      category: model.category,
      isPopular: model.isPopular,
      recipe: model.recipe,
      price: model.price,
    );
  }

  @override
  FoodModel migrateToModel(FoodDto dto) {
    return FoodModel(
      id: dto.id,
      title: dto.title,
      imageUrl: dto.imageUrl,
      rating: dto.rating,
      category: dto.category,
      isPopular: dto.isPopular,
      recipe: dto.recipe,
      price: dto.price,
    );
  }
}
