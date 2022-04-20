import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/restaurants_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';

class MainViewModel extends BaseViewModel {
  late HomeViewModel homeViewModel;
  late RestaurantsViewModel restaurantsViewModel;

  @override
  void initialize() {
    homeViewModel = HomeViewModel(mainViewModel: this)..initialize();
    restaurantsViewModel = RestaurantsViewModel(homeViewModel: homeViewModel);
  }

  MainViewModel({UpdateUi? updateUi}) : super(updateUi: updateUi);
}
