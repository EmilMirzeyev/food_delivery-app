import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/commands/concrency/go_to_restaurant_detail_screen_command.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';

class RestaurantsViewModel extends BaseViewModel {
  late HomeViewModel? homeViewModel;
  late IBaseCommand goToRestaurantDetailScreenCommand;

  @override
  void initialize() {
    goToRestaurantDetailScreenCommand = GoToRestaurantDetailScreenCommand();
  }
  RestaurantsViewModel({UpdateUi? updateUi, this.homeViewModel}) : super(updateUi: updateUi);
}
