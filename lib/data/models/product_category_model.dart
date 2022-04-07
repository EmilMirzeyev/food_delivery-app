import '/data/models/base_model.dart';

class ProductCategory extends BaseModel {
  final String category;
  bool? selectedCategory;

  ProductCategory({
    required dynamic id,
    required this.category,
    this.selectedCategory = false,
  }) : super(id: id);
}
