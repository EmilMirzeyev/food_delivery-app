import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/basket_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';

import '/app/commands/abstraction/i_base_command.dart';
import '/app/helpers/enums/request_state.dart';

class AddToBasketCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) async {
    BasketViewModel _basketViewModel = params!['bvm'];
    MainViewModel _mainViewModel = params['mvm'];
    BaseViewModel _viewModel = params['vm'];
    FoodModel _product = params['product'];
    try {
      if (_basketViewModel.basket.contains(_product)) {
        _basketViewModel.basket.remove(_product);
      } else {
        _basketViewModel.basket.add(_product);
      }
      _basketViewModel.getBasketRequestState = RequestState.succesfull;
    } catch (e) {
      _basketViewModel.getBasketRequestState = RequestState.unsuccesfull;
    } finally {
      _basketViewModel.tryUpdateUi();
      _mainViewModel.tryUpdateUi();
      _viewModel.tryUpdateUi();
    }
  }
}
