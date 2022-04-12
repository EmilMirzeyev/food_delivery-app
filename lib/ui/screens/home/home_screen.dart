import 'package:flutter/material.dart';
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
                        child: Icon(Icons.filter_alt_rounded, color: UiConstraints.instance.kfe734c),
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
                children: [
                  Text(
                    'Nearby Place',
                    style: UiConstraints.instance.px14w600k171718,
                  ),
                  Text(
                    'See All (12)',
                    style: UiConstraints.instance.px12w600kfe734c,
                  ),
                ],
              ),
              ..._homeViewModel.restaurants.map((e) => Text(
                    e.title,
                    style: UiConstraints.instance.px12w600kfe734c,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
