import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/models/food_model.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import '/ui/utils/constraints/ui_constraints.dart';
import '/ui/view_models/concrency/home_viewmodel.dart';

class HomeFoodSearch extends SearchDelegate {
  final HomeViewModel viewModel;
  HomeFoodSearch(this.viewModel);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Center(
        child: Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            child: Text(
              'Clear',
              style: UiConstraints.instance.px12w400kff2c2b,
            ),
            onTap: () {
              query = '';
            },
          ),
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<RestaurantModel> allRestaurantList = [];
    List<RestaurantModel> restaurantList = [];
    List<FoodModel> mealList = [];
    List<dynamic> listQuery = [];
    bool allRestaurants = false;
    final Size _size = MediaQuery.of(context).size;
    for (var restaurant in viewModel.restaurants) {
      if (restaurant.title.toLowerCase().contains(query.toLowerCase())) {
        restaurantList.add(restaurant);

        if (restaurantList.length > 3) {
          allRestaurantList = restaurantList.sublist(0, 3);
        } else {
          allRestaurantList = restaurantList;
        }
      }
      for (var meal in restaurant.foods) {
        if (meal.title.toLowerCase().contains(query.toLowerCase())) {
          mealList.add(meal);
        }
      }
    }

    void toggleRestaurant() {
      allRestaurants = !allRestaurants;
      allRestaurants == true ? allRestaurantList = restaurantList : allRestaurantList = restaurantList.sublist(0, 3);
    }

    listQuery = [...restaurantList, ...mealList];

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          color: UiConstraints.instance.kfff,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    runSpacing: 14.0,
                    children: [
                      ...allRestaurantList
                          .map(
                            (result) => Container(
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
                                        result.imageUrl,
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
                                      Text(result.title),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(result.location),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
                restaurantList.length > 3
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Stack(
                          children: [
                            Container(
                              width: _size.width,
                              height: 1.0,
                              color: UiConstraints.instance.kc4c4c4,
                              margin: const EdgeInsets.only(top: 21.0),
                            ),
                            Center(
                              child: SizedBox(
                                height: 42.0,
                                child: ElevatedButton(
                                  onPressed: () => setState(() => toggleRestaurant()),
                                  style: ElevatedButton.styleFrom(
                                    primary: allRestaurants ? Colors.amber : Colors.red,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: Text(allRestaurants ? "Show Less" : "Show More"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      ...mealList
                          .map((result) => InkWell(
                                child: SizedBox(
                                  width: _size.width * 0.5 - 8.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.0),
                                        color: UiConstraints.instance.kfff,
                                        boxShadow: [
                                          BoxShadow(
                                            color: UiConstraints.instance.k3a4f66.withOpacity(0.3),
                                            offset: const Offset(2, 0),
                                            blurRadius: 5.0,
                                            spreadRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(12.0),
                                                child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: Image.asset(
                                                    result.imageUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 8.0,
                                                left: 8.0,
                                                child: Container(
                                                  padding: const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                    color: UiConstraints.instance.kfff,
                                                    borderRadius: BorderRadius.circular(9999),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '₼',
                                                        style: UiConstraints.instance.px12w600kfe734c,
                                                      ),
                                                      Text(
                                                        result.price.toStringAsFixed(2),
                                                        style: UiConstraints.instance.px18w600k171718,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: -15.0,
                                                left: 8.0,
                                                child: Container(
                                                  height: 30.0,
                                                  padding: const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                    color: UiConstraints.instance.kfff,
                                                    borderRadius: BorderRadius.circular(9999),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: UiConstraints.instance.kfe734c.withOpacity(0.1),
                                                        offset: const Offset(0, 5),
                                                        blurRadius: 6.0,
                                                        spreadRadius: 2.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Wrap(
                                                      direction: Axis.horizontal,
                                                      crossAxisAlignment: WrapCrossAlignment.center,
                                                      spacing: 2.0,
                                                      children: [
                                                        Text(result.rating.rate.toStringAsFixed(1), style: UiConstraints.instance.px13w500k171718),
                                                        const Icon(
                                                          Icons.star,
                                                          size: 12.0,
                                                          color: Colors.amber,
                                                        ),
                                                        Text(
                                                          '(${result.rating.count})',
                                                          style: UiConstraints.instance.px12w400kc4c4c4,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  result.title,
                                                  textAlign: TextAlign.start,
                                                  style: UiConstraints.instance.px18w600k171718.copyWith(
                                                    fontSize: 16.0,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                Text(
                                                  result.recipe,
                                                  maxLines: 2,
                                                  style: UiConstraints.instance.px12w600k3a4f66.copyWith(
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                    primary: UiConstraints.instance.kfe734c,
                                                    shape: const StadiumBorder(),
                                                  ),
                                                  child: const Text('Add'),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ],
                  ),
                ),
                if (listQuery.isEmpty)
                  Container(
                    color: UiConstraints.instance.kfff,
                    child: const Center(
                      child: Text('There is no search results'),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
