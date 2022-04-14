import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';

class PopularRestaurantsWidget extends StatelessWidget {
  const PopularRestaurantsWidget({Key? key, required this.viewModel}) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SizedBox(
      height: 200.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 12.0,
        ),
        itemCount: viewModel.restaurants.length,
        itemBuilder: (BuildContext context, int i) {
          RestaurantModel el = viewModel.restaurants[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                Container(
                  height: 200.0,
                  width: _size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.asset(
                    el.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 60.0,
                    width: _size.width * 0.7,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: UiConstraints.instance.kf8f8f8.withOpacity(0.9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              el.title,
                              style: UiConstraints.instance.px18w600k171718,
                            ),
                            Text(
                              '${el.foods.length} recipes',
                              style: UiConstraints.instance.px14w600k617282,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: el.rating.rate,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(el.rating.count.toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
