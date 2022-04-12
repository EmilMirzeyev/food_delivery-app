import 'package:food_delivery_app/app/services/abstraction/i_restaurants_service.dart';
import 'package:food_delivery_app/app/services/concrency/restaurants_service.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';

import '/app/commands/abstraction/i_base_command.dart';
import '/app/helpers/enums/request_state.dart';

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

class GetRestaurantsCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) async {
    HomeViewModel _homeViewModel = params!['vm'];
    try {
      _homeViewModel.getProductsRequestState = RequestState.waiting;
      _homeViewModel.tryUpdateUi();
      IRestaurantsService restaurantsService = RestaurantService();

      final _products = await restaurantsService.getRestaurants();
      _homeViewModel.restaurants.addAll(_products);
      _homeViewModel.getProductsRequestState = RequestState.succesfull;
    } catch (e) {
      _homeViewModel.getProductsRequestState = RequestState.unsuccesfull;
    } finally {
      _homeViewModel.tryUpdateUi();
    }
  }
}
