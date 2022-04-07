import '/data/dtos/product_dto.dart';
import '/data/migrator/migrator.dart';
import '/data/models/product_model.dart';

class ProductMigrator implements Migrator<ProductModel, ProductDto> {
  @override
  ProductDto migrateToDto(ProductModel model) {
    return ProductDto(
      id: model.id,
      title: model.title,
      description: model.description,
      category: model.category,
      price: model.price,
      image: model.imageUrl,
      rating: model.rating,
    );
  }

  @override
  ProductModel migrateToModel(ProductDto dto) {
    return ProductModel(
        id: dto.id,
        title: dto.title,
        description: dto.description,
        category: dto.category,
        price: double.tryParse(dto.price.toString())!,
        imageUrl: dto.image,
        rating: dto.rating);
  }
}
