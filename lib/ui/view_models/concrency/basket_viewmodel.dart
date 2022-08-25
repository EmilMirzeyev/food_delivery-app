import 'package:food_delivery_app/app/helpers/enums/request_state.dart';
import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';

class BasketViewModel extends BaseViewModel {
  List<FoodModel> basket = [];

  late RequestState getBasketRequestState;

  void updateCount(int num, FoodModel food) {
    if (food.quantity! <= 1 && num < 0) {
      return;
    }
    food.quantity = food.quantity! + num;
    tryUpdateUi();
  }

  @override
  void initialize() {
    getBasketRequestState = RequestState.default_;
  }

  BasketViewModel({UpdateUi? updateUi}) : super(updateUi: updateUi);
}
