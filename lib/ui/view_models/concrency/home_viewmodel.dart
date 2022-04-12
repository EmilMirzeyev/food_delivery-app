import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/commands/concrency/get_restaurants_command.dart';
import 'package:food_delivery_app/app/helpers/enums/request_state.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  List<RestaurantModel> restaurants = [];
  late RequestState getProductsRequestState;
  late IBaseCommand getRestaurantsCommand;
  @override
  void initialize() {
    getProductsRequestState = RequestState.default_;
    getRestaurantsCommand = GetRestaurantsCommand();
    getRestaurantsCommand.doExecute({"vm": this});
  }

  HomeViewModel({UpdateUi? updateUi}) : super(updateUi: updateUi);
}
