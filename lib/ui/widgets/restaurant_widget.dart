import 'package:flutter/material.dart';
import '/data/models/restaurant_model.dart';
import '/ui/utils/constraints/ui_constraints.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantWidget({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 80.0,
      padding: const EdgeInsets.only(right: 6.0),
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
              child: Stack(
                children: [
                  Image.asset(
                    restaurant.imageUrl,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: UiConstraints.instance.kfff,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10.0,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          restaurant.rating.rate.toString(),
                          style: UiConstraints.instance.px12w400k171718,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(restaurant.title),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  restaurant.location,
                  style: UiConstraints.instance.px11w500k617282,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          InkWell(
            child: Icon(
              Icons.keyboard_arrow_right,
              color: UiConstraints.instance.kc4c4c4,
            ),
          )
        ],
      ),
    );
  }
}
