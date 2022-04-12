import '../../dtos/restaurant_dto.dart';

abstract class IRestaurantsNetworkManager {
  Future<List<RestaurantDto>> getRestaurants();
}
