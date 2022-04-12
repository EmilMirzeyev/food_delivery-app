import 'package:food_delivery_app/data/dtos/food_dto.dart';
import 'package:food_delivery_app/data/dtos/restaurant_dto.dart';
import 'package:food_delivery_app/data/network/abstraction/i_food_delivery_restaurants_network_manager.dart';

class RestaurantsNetworkManager extends IFoodDeliveryRestaurantsNetworkManager {
  @override
  Future<List<RestaurantDto>> getRestaurants() async {
    List<RestaurantDto> _dtos = [
      RestaurantDto(
          title: "Noma",
          description:
              "Noma is a three-Michelin-star restaurant run by chef René Redzepi in Copenhagen, Denmark. The name is a syllabic abbreviation of the two Danish words 'nordisk' (Nordic) and 'mad' (food). Opened in 2003, the restaurant is known for its focus on foraging, invention and interpretation of New Nordic Cuisine. In 2010, 2011, 2012, and 2014, it was ranked as the Best Restaurant in the World by Restaurant magazine. In 2021 it won the first spot in the World's 50 Best Restaurants Awards.",
          location: "Denmark, Copenhagen,	Refshalevej 96",
          imageUrl: "assets/images/restaurants/noma.jpg",
          rating: Rating(
            rate: 4.8,
            count: 56,
          ),
          foods: [
            FoodDto(
              title: "Sezar",
              recipe: "Xiyar Pomidor",
              price: 48.25,
              imageUrl: "assets/images/foods/sezar.jpg",
              category: "Salads",
              rating: Rating(
                rate: 3.2,
                count: 41,
              ),
            ),
            FoodDto(
              title: "Beef Wellington",
              recipe: "Un, droj, mal eti",
              price: 48.25,
              imageUrl: "assets/images/foods/sezar.jpg",
              category: "Salads",
              rating: Rating(
                rate: 3.2,
                count: 41,
              ),
            ),
          ])
    ];

    return _dtos;
  }
}
