import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/data/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_media.dart';
import 'package:food_delivery_app/ui/view_models/concrency/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> testArray = ['qunduz', 'sincab', 'kentozavr'];
  late HomeViewModel _homeViewModel;
  @override
  void initState() {
    _homeViewModel = HomeViewModel();
    _homeViewModel.updateUi = setState;
    _homeViewModel.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: [
            InkWell(
              child: Container(
                height: 42.0,
                width: 42.0,
                decoration: BoxDecoration(
                  color: UiConstraints.instance.kf8f8f8,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.menu,
                  color: UiConstraints.instance.k171718,
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Deliver to',
                          style: UiConstraints.instance.px13w500k171718,
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          size: 16.0,
                          color: UiConstraints.instance.k171718,
                        ),
                      ],
                    ),
                    Text(
                      'Parjiat, Housing Estate',
                      style: UiConstraints.instance.px14w600kfe734c,
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: InkWell(
                child: Container(
                  height: 42.0,
                  width: 42.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.asset(UiMedia.instance.profilePath),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              Container(
                width: _size.width,
                height: 42.0,
                decoration: BoxDecoration(
                  color: UiConstraints.instance.kf8f8f8,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.search,
                              color: UiConstraints.instance.kc4c4c4,
                            ),
                          ),
                          Text(
                            'Find Your Food',
                            style: UiConstraints.instance.px14w400kc4c4c4,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.filter_alt_rounded,
                          color: UiConstraints.instance.kfe734c,
                        ),
                      ),
                    )
                  ],
                ),
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
                  Text(
                    'See All (12)',
                    style: UiConstraints.instance.px12w600kfe734c,
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
                    (e) => Container(
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
                  Text(
                    'See All (12)',
                    style: UiConstraints.instance.px12w600kfe734c,
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                height: 200.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 12.0,
                  ),
                  itemCount: _homeViewModel.restaurants.length,
                  itemBuilder: (BuildContext context, int i) {
                    RestaurantModel el = _homeViewModel.restaurants[i];
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
              ),
              const SizedBox(
                height: 130.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
