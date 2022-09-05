import 'package:flutter/material.dart';
import '/ui/widgets/restaurant_widget.dart';
import '/app/di/app_di_container.dart';
import '/ui/utils/constraints/ui_constraints.dart';
import '/ui/view_models/concrency/restaurants_viewmodel.dart';
import '/ui/widgets/main_app_bar.dart';
import '/ui/widgets/restaurant_search_widget.dart';
import '/ui/widgets/search_bar_widget.dart';

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
                searchDelegateWidget: RestaurantSearch(_restaurantsViewModel.homeViewModel!),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _restaurantsViewModel.homeViewModel!.restaurants.length,
                separatorBuilder: (BuildContext context, int i) {
                  return const SizedBox(
                    height: 16.0,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final restaurant = _restaurantsViewModel.homeViewModel!.restaurants[index];
                  return InkWell(
                      onTap: () => _restaurantsViewModel.goToRestaurantDetailScreenCommand.doExecute(
                            {'mvm': _restaurantsViewModel.homeViewModel!.mainViewModel, 'restaurant': restaurant},
                          ),
                      child: RestaurantWidget(restaurant: restaurant));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
