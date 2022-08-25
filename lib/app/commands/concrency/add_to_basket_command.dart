import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/basket_viewmodel.dart';

import '/app/commands/abstraction/i_base_command.dart';
import '/app/helpers/enums/request_state.dart';

class AddToBasketCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) async {
    BasketViewModel _baskeViewModel = params!['fvm'];
    BaseViewModel _viewModel = params['vm'];
    FoodModel _product = params['product'];
    try {
      if (_baskeViewModel.basket.contains(_product)) {
        _baskeViewModel.basket.remove(_product);
      } else {
        _baskeViewModel.basket.add(_product);
      }
      _baskeViewModel.getBasketRequestState = RequestState.succesfull;
    } catch (e) {
      _baskeViewModel.getBasketRequestState = RequestState.unsuccesfull;
    } finally {
      _baskeViewModel.tryUpdateUi();
      _viewModel.tryUpdateUi();
    }
  }
}
