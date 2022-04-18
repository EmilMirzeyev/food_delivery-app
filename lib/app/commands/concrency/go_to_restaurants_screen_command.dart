import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/ui/screens/all_restaurants/restaurants_screen.dart';

class GoToRestaurantsScreenCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return true;
  }

  @override
  void execute(Map? params) {
    // MainViewModel _vm = params!['vm'];
    // final _screen = const RestaurantsScreen();
    final _router = AppDiContainer.instance.appRouter;
    _router.goTo(screen: const RestaurantsScreen());
  }
}
