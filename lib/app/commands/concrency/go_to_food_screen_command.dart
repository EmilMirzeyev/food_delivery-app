import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/ui/screens/food_detail/components/food_screen.dart';
import 'package:food_delivery_app/ui/view_models/concrency/basket_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/food_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';

class GoToFoodDetailScreenCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) {
    FoodModel _food = params!['food'];
    MainViewModel mainViewModel = params['mvm'];
    BasketViewModel basketViewModel = params['bvm'];
    final FoodViewModel foodViewModel = FoodViewModel(
      food: _food,
      mainViewModel: mainViewModel,
      basketViewModel: basketViewModel,
    );
    final _router = AppDiContainer.instance.appRouter;
    _router.goTo( 
      screen: FoodScreen(foodViewModel: foodViewModel),
    );
  }
}
