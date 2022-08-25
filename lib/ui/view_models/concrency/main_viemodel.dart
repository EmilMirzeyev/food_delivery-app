import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/commands/concrency/go_to_basket_screen_command.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/basket_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/restaurants_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';

class MainViewModel extends BaseViewModel {
  late HomeViewModel homeViewModel;
  late RestaurantsViewModel restaurantsViewModel;
  late BasketViewModel? basketViewModel;

  late IBaseCommand goToBasketScreenCommand;

  @override
  void initialize() {
    homeViewModel = HomeViewModel(mainViewModel: this)..initialize();
    restaurantsViewModel = RestaurantsViewModel(homeViewModel: homeViewModel);
    goToBasketScreenCommand = GoToBasketScreenCommand();
    basketViewModel = BasketViewModel()..initialize();
  }

  MainViewModel({UpdateUi? updateUi}) : super(updateUi: updateUi);
}
