import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    Size _size = MediaQuery.of(context).size;

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
                    height: widget.restaurantViewModel!.selectedIndex == 0
                        ? widget.restaurantViewModel!.filteredFoods.length % 2 == 0
                            ? (widget.restaurantViewModel!.filteredFoods.length / 2) * 310.0 + 48.0
                            : ((widget.restaurantViewModel!.filteredFoods.length + 1) / 2) * 310.0 + 48.0
                        : 800.0,
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
                                      children: List.generate(
                                        widget.restaurantViewModel!.foodCategories.length,
                                        (i) {
                                          final String category = widget.restaurantViewModel!.foodCategories[i];

                                          return Container(
                                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                                            margin: const EdgeInsets.only(right: 8.0),
                                            decoration: BoxDecoration(
                                              color: category == widget.restaurantViewModel!.selectedCategory
                                                  ? UiConstraints.instance.kfe734c
                                                  : UiConstraints.instance.kfff,
                                              borderRadius: BorderRadius.circular(999.0),
                                            ),
                                            child: InkWell(
                                              onTap: () => widget.restaurantViewModel!.selectCategory(category),
                                              child: Center(
                                                child: Text(
                                                  category,
                                                  style: category == widget.restaurantViewModel!.selectedCategory
                                                      ? UiConstraints.instance.px14w600kffffff
                                                      : UiConstraints.instance.px14w600k3a4f66,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                children: widget.restaurantViewModel!.filteredFoods
                                    .map(
                                      (result) => InkWell(
                                        onTap: () => widget.restaurantViewModel!.goToFoodDetailScreenCommand.doExecute({
                                          "food": result,
                                          "mvm": widget.restaurantViewModel!.mainViewModel,
                                          "bvm": widget.restaurantViewModel!.mainViewModel.basketViewModel
                                        }),
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
                                                                Text(result.rating.rate!.toStringAsFixed(1), style: UiConstraints.instance.px13w500k171718),
                                                                const Icon(
                                                                  Icons.star,
                                                                  size: 12.0,
                                                                  color: Colors.amber,
                                                                ),
                                                                Text(
                                                                  '(${result.rating.count})',
                                                                  style: UiConstraints.instance.px12w400kc4c4c4,
                                                                ),
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
                                                          onPressed: () => widget.restaurantViewModel!.addToBasketCommand.doExecute({
                                                            "bvm": widget.restaurantViewModel!.mainViewModel.basketViewModel,
                                                            "mvm": widget.restaurantViewModel!.mainViewModel,
                                                            "vm": widget.restaurantViewModel,
                                                            "product": result
                                                          }),
                                                          style: ElevatedButton.styleFrom(
                                                            primary: widget.restaurantViewModel!.mainViewModel.basketViewModel!.basket.contains(result)
                                                                ? UiConstraints.instance.k3a4f66
                                                                : UiConstraints.instance.kfe734c,
                                                            shape: const StadiumBorder(),
                                                          ),
                                                          child: widget.restaurantViewModel!.mainViewModel.basketViewModel!.basket.contains(result)
                                                              ? const Text('Added')
                                                              : const Text('Add'),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: <Widget>[
                                  ...widget.restaurantViewModel!.restaurant.additionalInfo!
                                      .map(
                                        (e) => Chip(
                                          avatar: CircleAvatar(backgroundImage: AssetImage(e.icon)),
                                          label: Text(e.info),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          backgroundColor: UiConstraints.instance.kf8f8f8,
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Stack(
                                children: [
                                  SizedBox(
                                    width: _size.width,
                                    height: 200.0,
                                    child: ClipRRect(
                                      borderRadius: UiConstraints.instance.borderRadius,
                                      child: GoogleMap(
                                        onMapCreated: widget.restaurantViewModel!.onMapCreated,
                                        markers: widget.restaurantViewModel!.markers,
                                        initialCameraPosition: widget.restaurantViewModel!.cameraPosition,
                                        zoomControlsEnabled: false,
                                        zoomGesturesEnabled: true,
                                        mapType: MapType.satellite,
                                        scrollGesturesEnabled: true,
                                        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                                          Factory<OneSequenceGestureRecognizer>(
                                            () => EagerGestureRecognizer(),
                                          ),
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 8.0,
                                    top: 8.0,
                                    child: InkWell(
                                      onTap: () => widget.restaurantViewModel!.recenterMap(),
                                      child: CircleAvatar(
                                        backgroundColor: UiConstraints.instance.kf8f8f8,
                                        child: Icon(
                                          Icons.gps_fixed,
                                          color: UiConstraints.instance.k171718,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  '\t\t\t\t\t\t\t' + widget.restaurantViewModel!.restaurant.description,
                                  style: UiConstraints.instance.px12w500k617282.copyWith(fontStyle: FontStyle.italic, height: 1.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
