import 'package:flutter/material.dart';
import '/ui/utils/constraints/ui_constraints.dart';
import '/ui/view_models/concrency/restaurant_viewmodel.dart';

class RestaurantHeadingWidget extends StatelessWidget {
  const RestaurantHeadingWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final RestaurantViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            viewModel.restaurant.title,
            style: UiConstraints.instance.px24w600k171718,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            viewModel.restaurant.location,
            style: UiConstraints.instance.px12w600kfe734c,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: viewModel.opened ? UiConstraints.instance.k150_187_124 : UiConstraints.instance.kff2c2b,
                radius: 16.0,
                child: Icon(
                  Icons.store,
                  color: UiConstraints.instance.kfff,
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                viewModel.opened ? 'Open till ${viewModel.closingTime}' : "Will open at ${viewModel.openingTime}",
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: UiConstraints.instance.kfe734c.withAlpha(70),
                radius: 16.0,
                child: const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 4.0),
              Text('${viewModel.restaurant.rating.rate} (${viewModel.restaurant.rating.count})'),
            ],
          ),
        ],
      ),
    );
  }
}