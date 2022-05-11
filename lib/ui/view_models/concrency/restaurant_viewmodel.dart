import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/app/routing/abstraction/i_router.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:intl/intl.dart';

class RestaurantViewModel extends BaseViewModel {
  final RestaurantModel restaurant;
  int selectedIndex = 0;
  int selectedCategory = 0;
  late IRouter router;
  late bool opened = DateTime.now().isAfter(restaurant.workingTimes.opening) && DateTime.now().isBefore(restaurant.workingTimes.closing);
  late String openingTime = DateFormat('kk:mm').format(restaurant.workingTimes.opening);
  late String closingTime = DateFormat('kk:mm').format(restaurant.workingTimes.closing);

  void changeCategory() {}

  void changeSelectedIndex(index) {
    selectedIndex = index;
    tryUpdateUi();
  }

  @override
  void initialize() {
    router = AppDiContainer.instance.appRouter;
  }

  RestaurantViewModel({UpdateUi? updateUi, required this.restaurant}) : super(updateUi: updateUi);
}
