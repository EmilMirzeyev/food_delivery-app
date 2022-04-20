import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';

class RestaurantsViewModel extends BaseViewModel {
  late HomeViewModel? homeViewModel;
  @override
  void initialize() {
    
  }
  RestaurantsViewModel({UpdateUi? updateUi, this.homeViewModel}) : super(updateUi: updateUi);
}
