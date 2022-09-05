import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/view_models/concrency/main_viemodel.dart';
import 'package:food_delivery_app/ui/widgets/search_bar_widget.dart';
import '../../widgets/restaurant_food_search_widget.dart';
import '/ui/pages/home/components/popular_restaurants_widget.dart';
import '/ui/utils/constraints/ui_constraints.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.mainViewModel}) : super(key: key);
  static const route = '/home-page';
  final MainViewModel mainViewModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.mainViewModel.homeViewModel;
    widget.mainViewModel.homeViewModel.updateUi = setState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final _homeViewModel = widget.mainViewModel.homeViewModel;
    return SingleChildScrollView(
      child: Container(
        color: UiConstraints.instance.kfff,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Welcome Foody',
                style: UiConstraints.instance.px24w600k171718,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            SearchBarWidget(
              searchDelegateWidget: RestaurantFoodSearch(_homeViewModel),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nearby Place',
                  style: UiConstraints.instance.px18w600k171718,
                ),
                TextButton(
                  onPressed: () => _homeViewModel.goToRestaurantsScreenCommand.doExecute({"vm": _homeViewModel.mainViewModel}),
                  child: Text(
                    'See All (12)',
                    style: UiConstraints.instance.px12w600kfe734c,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Wrap(
              runSpacing: 14.0,
              children: [
                ..._homeViewModel.nearestRestaurants.map(
                  (e) => InkWell(
                    onTap: () => _homeViewModel.goToRestaurantDetailScreenCommand.doExecute({'mvm': _homeViewModel.mainViewModel, 'restaurant': e}),
                    child: Container(
                      width: _size.width,
                      height: 80.0,
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: UiConstraints.instance.kf8f8f8,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                e.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(e.title),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(e.location),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular Restaurants',
                  style: UiConstraints.instance.px18w600k171718,
                ),
                TextButton(
                  onPressed: () => _homeViewModel.goToRestaurantsScreenCommand.doExecute({"vm": _homeViewModel.mainViewModel}),
                  child: Text(
                    'See All (12)',
                    style: UiConstraints.instance.px12w600kfe734c,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            PopularRestaurantsWidget(
              viewModel: _homeViewModel,
              goTo: (el) => _homeViewModel.goToRestaurantDetailScreenCommand.doExecute({'mvm': _homeViewModel.mainViewModel, 'restaurant': el}),
            ),
            const SizedBox(
              height: 100.0,
            )
          ],
        ),
      ),
    );
  }
}
