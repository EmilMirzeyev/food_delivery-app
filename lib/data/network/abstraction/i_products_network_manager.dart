import '/data/dtos/product_dto.dart';

abstract class IProductsNetworkManager {
  Future<List<ProductDto>> getProducts();
}
