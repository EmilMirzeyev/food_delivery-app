import '/app/di/app_di_container.dart';
import '/app/services/abstraction/i_products_service.dart';
import '/data/migrator/product_migrator.dart';
import '/data/models/product_model.dart';

class ProductService extends IProductsService {
  @override
  Future<List<ProductModel>> getProducts() async {
    final _productsNetworkManager = AppDiContainer.instance.productsNetworkManager;
    final _products = await _productsNetworkManager.getProducts();
    final _migratedProducts = _products.map((e) => ProductMigrator().migrateToModel(e)).toList();
    return _migratedProducts;
  }
}
