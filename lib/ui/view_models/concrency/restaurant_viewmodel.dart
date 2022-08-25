import 'package:food_delivery_app/app/commands/abstraction/i_base_command.dart';
import 'package:food_delivery_app/app/commands/concrency/add_to_basket_command.dart';
import 'package:food_delivery_app/app/commands/concrency/go_to_food_screen_command.dart';
import 'package:food_delivery_app/ui/view_models/concrency/basket_viewmodel.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';

import '/app/di/app_di_container.dart';
import '/app/routing/abstraction/i_router.dart';
import '/data/models/food_model.dart';
import '/data/models/restaurant_model.dart';
import '/ui/view_models/abstraction/i_base_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class RestaurantViewModel extends BaseViewModel {
  final RestaurantModel restaurant;
  late List<FoodModel> filteredFoods = [];
  late List<String> foodCategories = ["All", "Most popular"];
  int selectedIndex = 0;
  String selectedCategory = "";
  late IRouter router;
  late bool opened = DateTime.now().isAfter(restaurant.workingTimes.opening) && DateTime.now().isBefore(restaurant.workingTimes.closing);
  late String openingTime = DateFormat('kk:mm').format(restaurant.workingTimes.opening);
  late String closingTime = DateFormat('kk:mm').format(restaurant.workingTimes.closing);
  late GoogleMapController mapController;
  final Set<Marker> markers = {};
  final cameraPosition = const CameraPosition(
    target: LatLng(55.684341, 12.608375),
    zoom: 17,
  );
  late IBaseCommand addToBasketCommand;
  late IBaseCommand goToFoodDetailScreenCommand;
  late MainViewModel mainViewModel;

  void changeSelectedIndex(index) {
    selectedIndex = index;
    tryUpdateUi();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    if (category == "All") {
      filteredFoods = restaurant.foods;
    } else if (category == "Most popular") {
      filteredFoods = restaurant.foods.where((e) => e.isPopular).toList();
    } else {
      for (var foodCategory in foodCategories) {
        if (foodCategory == category) {
          filteredFoods = restaurant.foods.where((e) => e.category == category).toList();
        }
      }
    }
    tryUpdateUi();
  }

  void recenterMap() {
    mapController.moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    markers.add(
      Marker(
        markerId: const MarkerId('id-1'),
        // icon: mapMarker,
        position: const LatLng(55.684341, 12.608375),
        infoWindow: InfoWindow(title: restaurant.title),
      ),
    );
    tryUpdateUi();
  }

  @override
  void initialize() {
    filteredFoods.addAll(restaurant.foods);
    selectedCategory = foodCategories[0];
    for (var food in restaurant.foods) {
      if (!foodCategories.contains(food.category)) {
        foodCategories.add(food.category);
      }
    }
    addToBasketCommand = AddToBasketCommand();
    goToFoodDetailScreenCommand = GoToFoodDetailScreenCommand();
    router = AppDiContainer.instance.appRouter;
  }

  RestaurantViewModel({UpdateUi? updateUi, required this.restaurant, required this.mainViewModel}) : super(updateUi: updateUi);
}
