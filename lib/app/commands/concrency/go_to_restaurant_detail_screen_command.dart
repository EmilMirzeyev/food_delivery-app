import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/screens/restaurant_detail/restaurant_screen.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/restaurant_viewmodel.dart';

class GoToRestaurantDetailScreenCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) {
    MainViewModel _mainViewModel = params!['mvm'];
    RestaurantModel _restaurant = params['restaurant'];
    final RestaurantViewModel restaurantViewModel = RestaurantViewModel(restaurant: _restaurant, mainViewModel: _mainViewModel);
    final _router = AppDiContainer.instance.appRouter;
    _router.goTo(
      screen: RestaurantScreen(restaurantViewModel: restaurantViewModel),
    );
  }
}
