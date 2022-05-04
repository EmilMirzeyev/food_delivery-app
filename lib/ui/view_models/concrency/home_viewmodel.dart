import 'package:food_delivery_app/app/commands/concrency/go_to_restaurants_screen_command.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';
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
  late IBaseCommand goToRestaurantsScreenCommand;

  late MainViewModel? mainViewModel;

  @override
  void initialize() {
    getProductsRequestState = RequestState.default_;
    getRestaurantsCommand = GetRestaurantsCommand();
    getRestaurantsCommand.doExecute({"vm": this});
    goToRestaurantsScreenCommand = GoToRestaurantsScreenCommand();
  }

  HomeViewModel({UpdateUi? updateUi, this.mainViewModel})
      : super(updateUi: updateUi);
}
