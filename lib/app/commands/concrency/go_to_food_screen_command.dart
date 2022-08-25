import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/ui/screens/food_detail/components/food_screen.dart';
import 'package:food_delivery_app/ui/view_models/concrency/food_viewmodel.dart';

class GoToFoodDetailScreenCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) {
    FoodModel _food = params!['food'];
    final FoodViewModel foodViewModel = FoodViewModel(food: _food);
    final _router = AppDiContainer.instance.appRouter;
    _router.goTo(
      screen: FoodScreen(foodViewModel: foodViewModel),
    );
  }
}
