import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';
import 'package:food_delivery_app/ui/widgets/restaurant_widget.dart';

class RestaurantSearch extends SearchDelegate {
  final HomeViewModel viewModel;
  RestaurantSearch(this.viewModel);

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
    List<RestaurantModel> restaurantList = [];
    for (var restaurant in viewModel.restaurants) {
      if (restaurant.title.toLowerCase().contains(query.toLowerCase())) {
        restaurantList.add(restaurant);
      }
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      color: UiConstraints.instance.kfff,
      child: restaurantList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: ListView.separated(
                itemCount: restaurantList.length,
                separatorBuilder: (BuildContext context, int i) {
                  return const SizedBox(
                    height: 14.0,
                  );
                },
                itemBuilder: (context, index) {
                  var result = restaurantList[index];
                  return InkWell(
                    onTap: () {},
                    child: RestaurantWidget(restaurant: result),
                  );
                },
              ),
            )
          : Container(
              color: UiConstraints.instance.kfff,
              child: const Center(
                child: Text(
                  'There is no search results',
                ),
              ),
            ),
    );
  }
}
