import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/commands/concrency/add_to_basket_command.dart';
import 'package:food_delivery_app/ui/view_models/concrency/basket_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';

import '/data/models/food_model.dart';
import '/ui/view_models/abstraction/i_base_viewmodel.dart';

class FoodViewModel extends BaseViewModel {
  final FoodModel food;
  int? qty = 1;

  late MainViewModel mainViewModel;
  late BasketViewModel basketViewModel;

  late IBaseCommand addToBasketCommand;

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
    addToBasketCommand = AddToBasketCommand();
  }

  FoodViewModel({
    UpdateUi? updateUi,
    required this.food,
    required this.mainViewModel,
    required this.basketViewModel,
  }) : super(updateUi: updateUi);
}
