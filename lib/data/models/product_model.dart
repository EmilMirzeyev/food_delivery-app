import '/data/dtos/product_dto.dart';
import '/data/models/base_model.dart';

class ProductModel extends BaseModel {
  final String title;
  final String description;
  final String category;
  final double price;
  final String imageUrl;
  final Rating rating;
  bool isFavorite;
  bool inBasket;
  int quantity;

  ProductModel({
    required dynamic id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.rating,
    this.isFavorite = false,
    this.inBasket = false,
    this.quantity = 0,
  }) : super(id: id);
}
