import '/data/models/food_model.dart';
import '/ui/view_models/abstraction/i_base_viewmodel.dart';

class FoodViewModel extends BaseViewModel {
  final FoodModel food;
  int? qty = 1;

  void updateCount(int num) {
    if (qty! <= 1 && num < 0) {
      return;
    }
    qty = qty! + num;
    tryUpdateUi();
  }

  void addToCart() {
    food.quantity = qty;
  }

  @override
  void initialize() {
    qty = food.quantity;
  }

  FoodViewModel({UpdateUi? updateUi, required this.food}) : super(updateUi: updateUi);
}
