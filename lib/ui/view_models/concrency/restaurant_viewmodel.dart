import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/app/routing/abstraction/i_router.dart';
import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
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

  @override
  void initialize() {
    filteredFoods.addAll(restaurant.foods);
    selectedCategory = foodCategories[0];
    for (var food in restaurant.foods) {
      if (!foodCategories.contains(food.category)) {
        foodCategories.add(food.category);
      }
    }
    router = AppDiContainer.instance.appRouter;
  }

  RestaurantViewModel({UpdateUi? updateUi, required this.restaurant}) : super(updateUi: updateUi);
}

// import 'package:food_delivery_app/app/di/app_di_container.dart';
// import 'package:food_delivery_app/app/routing/abstraction/i_router.dart';
// import 'package:food_delivery_app/data/models/food_model.dart';
// import 'package:food_delivery_app/data/models/restaurant_model.dart';
// import 'package:food_delivery_app/ui/view_models/abstraction/i_base_viewmodel.dart';
// import 'package:intl/intl.dart';

// class RestaurantViewModel extends BaseViewModel {
//   final RestaurantModel restaurant;
//   late List<FoodModel> filteredFoods = [];
//   late List foodCategories = [
//     {
//       "id": 99999,
//       "category": "All",
//       "isSelected": true,
//     },
//     {
//       "id": 99998,
//       "category": "Most popular",
//       "isSelected": false,
//     },
//   ];
//   int selectedIndex = 0;
//   int selectedCategory = 0;
//   late IRouter router;
//   late bool opened = DateTime.now().isAfter(restaurant.workingTimes.opening) && DateTime.now().isBefore(restaurant.workingTimes.closing);
//   late String openingTime = DateFormat('kk:mm').format(restaurant.workingTimes.opening);
//   late String closingTime = DateFormat('kk:mm').format(restaurant.workingTimes.closing);

//   void changeSelectedIndex(index) {
//     selectedIndex = index;
//     tryUpdateUi();
//   }

//   void selectCategory(String category) {
//     if (category == "All") {
//       filteredFoods = restaurant.foods;
//     } else if (category == "Most popular") {
//       filteredFoods = restaurant.foods.where((e) => e.isPopular).toList();
//     } else {
//       for (var foodCategory in foodCategories) {
//         if (foodCategory == category) {
//           filteredFoods = restaurant.foods.where((e) => e.category == category).toList();
//         }
//       }
//     }
//     tryUpdateUi();
//   }

//   @override
//   void initialize() {
//     filteredFoods.addAll(restaurant.foods);
//     for (var food in restaurant.foods) {
//       if (!foodCategories.contains(food.category)) {
//         foodCategories.add(
//           {
//             "id": food.id,
//             "category": food.category,
//             "isSelected": false,
//           },
//         );
//       }
//     }
//     router = AppDiContainer.instance.appRouter;
//   }

//   RestaurantViewModel({UpdateUi? updateUi, required this.restaurant}) : super(updateUi: updateUi);
// }