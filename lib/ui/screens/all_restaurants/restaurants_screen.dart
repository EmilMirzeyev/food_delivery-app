import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/di/app_di_container.dart';
import 'package:food_delivery_app/ui/pages/home/components/home_food_search_widget.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/view_models/concrency/restaurants_viewmodel.dart';
import 'package:food_delivery_app/ui/widgets/main_app_bar.dart';
import 'package:food_delivery_app/ui/widgets/search_bar_widget.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({Key? key, required this.restaurantsViewModel}) : super(key: key);
  final RestaurantsViewModel restaurantsViewModel;

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  void initState() {
    widget.restaurantsViewModel.updateUi = setState;
    widget.restaurantsViewModel.initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final RestaurantsViewModel _restaurantsViewModel = widget.restaurantsViewModel;
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: MainAppBar(
          icon: Icon(
            Icons.arrow_back,
            color: UiConstraints.instance.k171718,
          ),
          onLeading: () => AppDiContainer.instance.appRouter.pop(),
        ),
      ),
      body: Container(
        height: _size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SearchBarWidget(
                searchDelegateWidget: HomeFoodSearch(_restaurantsViewModel.homeViewModel!),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _restaurantsViewModel.homeViewModel!.restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  final restaurant = _restaurantsViewModel.homeViewModel!.restaurants[index];
                  return Stack(
                    children: [
                      Container(
                        height: 250.0,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        width: _size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage(restaurant.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.red,
                        ),
                        child: Column(children: [],),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
