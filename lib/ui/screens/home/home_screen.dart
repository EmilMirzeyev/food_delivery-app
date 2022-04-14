import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/ui/screens/home/components/home_food_search_widget.dart';
import 'package:food_delivery_app/ui/screens/home/components/popular_restaurants_widget.dart';
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
      extendBody: true,
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
                      child: InkWell(
                        onTap: () => showSearch(context: context, delegate: HomeFoodSearch(_homeViewModel)),
                        child: SizedBox(
                          height: 42.0,
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
                      ),
                    ),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => buildSheet(),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: SvgPicture.asset(
                            UiMedia.instance.filtersPath,
                            color: UiConstraints.instance.kfe734c,
                            width: 24.0,
                          )),
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
              PopularRestaurantsWidget(viewModel: _homeViewModel),
              const SizedBox(
                height: 100.0,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiConstraints.instance.kfe734c,
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset(
            UiMedia.instance.shoppingPath,
            color: UiConstraints.instance.kfff,
            width: 28.0,
          ),
          onPressed: () {},
          color: UiConstraints.instance.k171718,
          iconSize: 30.0,
          splashRadius: 0.1,
          highlightColor: Colors.transparent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 25.0,
        notchMargin: 6.0,
        color: UiConstraints.instance.kf8f8f8,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    UiMedia.instance.homePath,
                    color: UiConstraints.instance.k3a4f66,
                    width: 30.0,
                  ),
                  onPressed: () {},
                  color: UiConstraints.instance.k171718,
                  iconSize: 30.0,
                  splashRadius: 0.1,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: UiConstraints.instance.k3a4f66,
                  ),
                  onPressed: () {},
                  color: UiConstraints.instance.k171718,
                  iconSize: 30.0,
                  splashRadius: 0.1,
                  highlightColor: Colors.transparent,
                ),
                const SizedBox(
                  width: 26.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit_note,
                    color: UiConstraints.instance.k3a4f66,
                  ),
                  onPressed: () {},
                  color: UiConstraints.instance.k171718,
                  iconSize: 30.0,
                  splashRadius: 0.1,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: UiConstraints.instance.k3a4f66,
                  ),
                  onPressed: () {},
                  color: UiConstraints.instance.k171718,
                  iconSize: 30.0,
                  splashRadius: 0.1,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSheet() => Container();
}
