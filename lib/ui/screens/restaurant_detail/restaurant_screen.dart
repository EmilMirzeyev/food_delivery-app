import 'package:flutter/material.dart';
import '/ui/screens/restaurant_detail/components/restaurant_heading_widget.dart';
import '/ui/utils/constraints/ui_constraints.dart';
import '/ui/view_models/concrency/restaurant_viewmodel.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key, this.restaurantViewModel}) : super(key: key);
  static const route = '/restaurant-screen';
  final RestaurantViewModel? restaurantViewModel;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  void initState() {
    widget.restaurantViewModel!.updateUi = setState;
    widget.restaurantViewModel!.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            leading: InkWell(
              onTap: () => widget.restaurantViewModel!.router.pop(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CircleAvatar(
                  backgroundColor: UiConstraints.instance.kfe734c,
                  radius: 10.0,
                  child: Icon(
                    Icons.arrow_back,
                    color: UiConstraints.instance.kfff,
                  ),
                ),
              ),
            ),
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    widget.restaurantViewModel!.restaurant.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: RestaurantHeadingWidget(
              viewModel: widget.restaurantViewModel!,
            ),
          ),
          SliverToBoxAdapter(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        color: UiConstraints.instance.kf8f8f8,
                      ),
                      child: TabBar(
                        onTap: (int index) => widget.restaurantViewModel!.changeSelectedIndex(index),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                          color: UiConstraints.instance.kfff,
                        ),
                        unselectedLabelColor: UiConstraints.instance.kc4c4c4,
                        tabs: const [
                          Tab(text: 'Menu'),
                          Tab(text: 'Info'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: widget.restaurantViewModel!.selectedIndex == 0 ? 650.0 : 250.0,
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 48.0,
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                                horizontal: 16.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                  horizontal: BorderSide(width: 2.0, color: UiConstraints.instance.kf8f8f8),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 8.0,
                                        height: 3.0,
                                        color: UiConstraints.instance.k150_187_124,
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Container(
                                        width: 16.0,
                                        height: 3.0,
                                        color: UiConstraints.instance.k150_187_124,
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Container(
                                        width: 24.0,
                                        height: 3.0,
                                        color: UiConstraints.instance.k150_187_124,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                                          margin: const EdgeInsets.only(right: 8.0),
                                          decoration: BoxDecoration(
                                            color: UiConstraints.instance.k171718,
                                            borderRadius: BorderRadius.circular(999.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Most Popular',
                                              style: UiConstraints.instance.px14w600kffffff,
                                            ),
                                          ),
                                        ),
                                        ...widget.restaurantViewModel!.restaurant.foods
                                            .map(
                                              (e) => Container(
                                                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                                                margin: const EdgeInsets.only(right: 8.0),
                                                decoration: BoxDecoration(
                                                  color: UiConstraints.instance.k171718,
                                                  borderRadius: BorderRadius.circular(999.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    e.category,
                                                    style: UiConstraints.instance.px14w600kffffff,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.directions_bike),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text('Qunduz'),
          ),
        ],
      ),
    );
  }
}
