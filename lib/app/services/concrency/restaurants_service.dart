import '/app/di/app_di_container.dart';
import '../abstraction/i_restaurants_service.dart';
import '../../../data/migrator/restaurant_migrator.dart';
import '../../../data/models/restaurant_model.dart';

class RestaurantService extends IRestaurantsService {
  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    final _restaurantsNetworkManager = AppDiContainer.instance.restaurantsNetworkManager;
    final _products = await _restaurantsNetworkManager.getRestaurants();
    final _migratedProducts = _products.map((e) => RestaurantMigrator().migrateToModel(e)).toList();
    return _migratedProducts;
  }
}
