import '../../../data/models/restaurant_model.dart';

abstract class IRestaurantsService {
  Future<List<RestaurantModel>> getRestaurants();
}
