import 'package:flutter/material.dart';
import '/data/models/food_model.dart';
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
    List<FoodModel> matchQuery = [];
    for (var restaurants in viewModel.restaurants) {
      for (var meal in restaurants.foods) {
        if (meal.title.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(meal);
        }
      }
    }
    return Container(
      color: UiConstraints.instance.kfff,
      child: matchQuery.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 320.0,
              ),
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                );
              },
            )
          : Container(
              color: UiConstraints.instance.kfff,
              child: const Center(
                child: Text('There is no search results'),
              ),
            ),
    );
  }
}