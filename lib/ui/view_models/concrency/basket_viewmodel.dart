import 'package:food_delivery_app/app/helpers/enums/request_state.dart';
import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';

class BasketViewModel extends BaseViewModel {
  List<FoodModel> basket = [];
  late MainViewModel mainViewModel;

  late RequestState getBasketRequestState;

  void updateCount(int num, FoodModel food) {
    if (food.quantity! <= 1 && num < 0) {
      return;
    }
    food.quantity = food.quantity! + num;
    tryUpdateUi();
  }

  void deleteBasketItem(int id) {
    for (var i = 0; i < basket.length; i++) {
      if (basket[i].id == id) {
        basket[i].quantity = 1;
        basket.remove(basket[i]);
      }
    }
    tryUpdateUi();
    mainViewModel.tryUpdateUi();
  }

  @override
  void initialize() {
    getBasketRequestState = RequestState.default_;
  }

  BasketViewModel({UpdateUi? updateUi, required this.mainViewModel}) : super(updateUi: updateUi);
}
