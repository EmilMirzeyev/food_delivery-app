
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

class ProductDto extends BaseDto {
  final String title;
  final String description;
  final String category;
  final dynamic price;
  final String image;
  final Rating rating;

  ProductDto({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
    dynamic id,
  }) : super(id: id);
}
