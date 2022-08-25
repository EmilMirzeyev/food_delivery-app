import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/ui/screens/basket/basket_screen.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';

class GoToBasketScreenCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) {
    MainViewModel _vm = params!['vm'];
    final _router = AppDiContainer.instance.appRouter;
    _router.goTo(
      screen: BasketScreen(
        basketViewModel: _vm.basketViewModel,
      ),
    );
  }
}
