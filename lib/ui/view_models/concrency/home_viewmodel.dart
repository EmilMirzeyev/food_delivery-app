import '/app/commands/abstraction/i_base_command.dart';
import '/app/commands/concrency/get_restaurants_command.dart';
import '/app/helpers/enums/request_state.dart';
import '/data/models/restaurant_model.dart';
import '/ui/view_models/abstraction/i_base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  List<RestaurantModel> restaurants = [];
  List<RestaurantModel> nearestRestaurants = [];

  late RequestState getProductsRequestState;
  late IBaseCommand getRestaurantsCommand;

  // void searchInit(query) {
  //   if (allRestaurantList.isEmpty) {
  //     for (var restaurant in restaurants) {
  //       if (restaurant.title.toLowerCase().contains(query.toLowerCase())) {
  //         restaurantList.add(restaurant);
  //       }
  //       for (var meal in restaurant.foods) {
  //         if (meal.title.toLowerCase().contains(query.toLowerCase())) {
  //           mealList.add(meal);
  //         }
  //       }
  //     }
  //     allRestaurants == true
  //         ? allRestaurantList = restaurantList
  //         : allRestaurantList = restaurantList.sublist(0, 3);
  //     listQuery = [...restaurantList, ...mealList];
  //   }
  // }

  @override
  void initialize() {
    getProductsRequestState = RequestState.default_;
    getRestaurantsCommand = GetRestaurantsCommand();
    getRestaurantsCommand.doExecute({"vm": this});
  }

  HomeViewModel({UpdateUi? updateUi}) : super(updateUi: updateUi);
}
